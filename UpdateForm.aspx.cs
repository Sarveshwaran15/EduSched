using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace schedule
{
    public partial class UpdateForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate dropdowns or other initial data if needed
            }
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedClass = ddlClass.SelectedValue;

            // Hide all timing fields initially
            shiftField.Visible = false;
            shift1Timings.Visible = false;
            shift2Timings.Visible = false;
            mcaTimings.Visible = false;
            btechTimings.Visible = false;

            // Show fields based on the selected class
            if (selectedClass.StartsWith("BCA"))
            {
                shiftField.Visible = true; // Shift field is required for BCA
            }
            else if (selectedClass.StartsWith("MCA"))
            {
                mcaTimings.Visible = true; // MCA class has its own timings
            }
            else if (selectedClass.StartsWith("B.Tech"))
            {
                btechTimings.Visible = true; // B.Tech has its own timings
            }
        }

        protected void ddlShift_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedShift = ddlShift.SelectedValue;

            // Show the appropriate timing dropdowns based on the selected shift
            shift1Timings.Visible = selectedShift == "Shift 1";
            shift2Timings.Visible = selectedShift == "Shift 2";
        }

        protected void btnPrintTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrintTimetable.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string year = ddlYear.SelectedValue;
            string selectedClass = ddlClass.SelectedValue;
            string selectedShift = ddlShift.SelectedValue;
            string selectedTiming = GetSelectedTiming(selectedClass, selectedShift);
            string course = ddlCourse.SelectedValue;
            string subject = txtSubject.Text.Trim();
            string teacher = txtTeacher.Text.Trim();
            string room = txtRoom.Text.Trim();
            string day = ddlDay.SelectedValue;

            if (IsFormValid(year, selectedClass, selectedShift, selectedTiming, course, subject, teacher, room, day))
            {
                if (IsTimingAvailable(selectedClass, selectedTiming, day))
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
                        {
                            con.Open();
                            string query = "INSERT INTO timetableClass (year_class, shift, day, period_time, course_code, course_name, subject, teacher, room_number) " +
                                           "VALUES (@SelectedClass, @Shift, @Day, @PeriodTime, @CourseCode, @CourseName, @Subject, @Teacher, @RoomNumber)";

                            using (SqlCommand command = new SqlCommand(query, con))
                            {
                                command.Parameters.AddWithValue("@SelectedClass", selectedClass);
                                command.Parameters.AddWithValue("@Shift", selectedShift);
                                command.Parameters.AddWithValue("@Day", day);
                                command.Parameters.AddWithValue("@PeriodTime", selectedTiming);
                                command.Parameters.AddWithValue("@CourseCode", course);
                                command.Parameters.AddWithValue("@CourseName", ddlCourse.SelectedItem.Text);
                                command.Parameters.AddWithValue("@Subject", subject);
                                command.Parameters.AddWithValue("@Teacher", teacher);
                                command.Parameters.AddWithValue("@RoomNumber", room);

                                int rowsAffected = command.ExecuteNonQuery();
                                lblMessage.Text = rowsAffected > 0 ? "Schedule updated successfully." : "No records were inserted.";
                                lblMessage.Visible = true;
                            }
                        }
                    }
                    catch (SqlException sqlEx)
                    {
                        lblMessage.Text = "Database Error: " + sqlEx.Message;
                        lblMessage.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.Visible = true;
                    }
                }
                else
                {
                    lblMessage.Text = "This timing is already allocated to another staff member.";
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Please fill all the fields.";
                lblMessage.Visible = true;
            }
        }

        private bool IsFormValid(string year, string selectedClass, string selectedShift, string selectedTiming, string course, string subject, string teacher, string room, string day)
        {
            // Validation logic to ensure all required fields are filled
            return !string.IsNullOrEmpty(year) &&
                   !string.IsNullOrEmpty(selectedClass) &&
                   (selectedClass.StartsWith("BCA") ? !string.IsNullOrEmpty(selectedShift) : true) && // Shift is required for BCA only
                   !string.IsNullOrEmpty(selectedTiming) &&
                   !string.IsNullOrEmpty(course) &&
                   !string.IsNullOrEmpty(subject) &&
                   !string.IsNullOrEmpty(teacher) &&
                   !string.IsNullOrEmpty(room) &&
                   !string.IsNullOrEmpty(day);
        }

        private string GetSelectedTiming(string selectedClass, string selectedShift)
        {
            // Logic to get the selected timing based on class and shift
            if (selectedClass.StartsWith("BCA"))
            {
                return selectedShift == "Shift 1" ? ddlShift1Timing.SelectedValue : ddlShift2Timing.SelectedValue;
            }
            else if (selectedClass.StartsWith("MCA"))
            {
                return ddlMCATiming.SelectedValue; // MCA class has its own timing dropdown
            }
            else if (selectedClass.StartsWith("B.Tech"))
            {
                return ddlBTechTiming.SelectedValue; // B.Tech class has its own timing dropdown
            }
            return null;
        }

        protected void btnAddLab_Click(object sender, EventArgs e)
        {
            // Redirect to the new lab page (for example, AddLabClaim.aspx)
            Response.Redirect("AddLabClaim.aspx");
        }

        private bool IsTimingAvailable(string selectedClass, string selectedTiming, string day)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                string query = "SELECT COUNT(*) FROM timetableClass WHERE year_class = @SelectedClass AND period_time = @PeriodTime AND day = @Day";
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@SelectedClass", selectedClass);
                    command.Parameters.AddWithValue("@PeriodTime", selectedTiming);
                    command.Parameters.AddWithValue("@Day", day);

                    con.Open();
                    int count = (int)command.ExecuteScalar();
                    return count == 0; // Return true if no existing records
                }
            }
        }
    }
}
