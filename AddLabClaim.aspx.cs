using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace schedule
{
    public partial class AddLabClaim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Pre-populate fields based on Session values
                if (Session["SelectedClass"] != null)
                {
                    ddlClass.SelectedValue = Session["SelectedClass"].ToString();
                    ddlClass_SelectedIndexChanged(sender, e);  // Trigger logic for class selection
                }

                if (Session["SelectedDay"] != null)
                {
                    ddlDay.SelectedValue = Session["SelectedDay"].ToString();
                }
            }
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedClass = ddlClass.SelectedValue;
            // Hide all timings initially
            shiftField.Visible = false;
            shift1Timings.Visible = false;
            shift2Timings.Visible = false;
            mcaTimings.Visible = false;
            btechTimings.Visible = false;

            // Show relevant shift and timings based on class selection
            if (selectedClass.StartsWith("BCA"))
            {
                shiftField.Visible = true; // Show shift selection
            }
            else if (selectedClass.StartsWith("MCA"))
            {
                mcaTimings.Visible = true; // Show MCA timings
            }
            else if (selectedClass.StartsWith("B.Tech"))
            {
                btechTimings.Visible = true; // Show B.Tech timings
            }
        }

        protected void ddlShift_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Show timings based on selected shift
            string selectedShift = ddlShift.SelectedValue;
            shift1Timings.Visible = selectedShift == "Shift 1";
            shift2Timings.Visible = selectedShift == "Shift 2";
        }

        protected void txtTools_TextChanged(object sender, EventArgs e)
        {
            string searchText = txtTools.Text.Trim();

            // Using ConfigurationManager for the connection string
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                string query = "SELECT LabName, Location FROM Labs WHERE Tools LIKE @SearchText";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SearchText", "%" + searchText + "%");
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        toolsList.InnerHtml = ""; // Clear previous results
                        while (reader.Read())
                        {
                            // Display tools and add a click event to get lab details
                            toolsList.InnerHtml += $"<div class='tool' onclick='getLabDetails(\"{reader["LabName"]}\", \"{reader["Location"]}\")'>{reader["LabName"]} - {reader["Location"]}</div>";
                        }
                    }
                }
            }
        }

        protected void btnClaimLab_Click(object sender, EventArgs e)
        {
            // Get selected lab details and display them
            string selectedLabName = Request.Form["selectedLabName"]; // Use AJAX or HiddenField for lab name
            string selectedLocation = Request.Form["selectedLocation"]; // Use AJAX or HiddenField for lab location

            if (!string.IsNullOrEmpty(selectedLabName) && !string.IsNullOrEmpty(selectedLocation))
            {
                labName.InnerText = selectedLabName;
                labLocation.InnerText = selectedLocation;
                labDetails.Visible = true; // Show lab details
                btnClaimLab.Visible = true; // Show claim button
            }
        }

        protected void btnSubmitLabClaim_Click(object sender, EventArgs e)
        {
            // Get selected course from ddlCourse dropdown
            string selectedCourse = ddlCourse.SelectedValue;

            // Check selected shift and retrieve timing from the correct dropdown
            string periodTime = string.Empty;
            string selectedShift = string.Empty;

            if (ddlClass.SelectedValue.StartsWith("MCA"))
            {
                // For MCA, we don't need shift, so we set periodTime from MCA timing dropdown
                periodTime = ddlMCATiming.SelectedValue;
            }
            else
            {
                if (ddlShift.SelectedValue == "Shift 1")
                {
                    periodTime = ddlShift1Timing.SelectedValue;
                    selectedShift = "Shift 1"; // Assign Shift 1 to selectedShift
                }
                else if (ddlShift.SelectedValue == "Shift 2")
                {
                    periodTime = ddlShift2Timing.SelectedValue;
                    selectedShift = "Shift 2"; // Assign Shift 2 to selectedShift
                }
            }

            // Ensure that periodTime is not empty and in the expected format
            string[] timings = periodTime.Split(new string[] { " to " }, StringSplitOptions.RemoveEmptyEntries);

            // Retrieve teacher name from the appropriate control
            string teacherName = txtTeacher.Text; // Or use txtTeacher.Text for TextBox input

            if (timings.Length == 2)
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
                {
                    string query = "INSERT INTO timetableClass (year_class, shift, day, period_time, course_code, course_name, subject, teacher, room_number) " +
                                   "VALUES (@year_class, @shift, @day, @period_time, @course_code, @course_name, @subject, @teacher, @room_number)";
                    try
                    {
                        connection.Open();

                        for (int i = 0; i < timings.Length; i++)
                        {
                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@year_class", ddlClass.SelectedValue);
                                // For MCA, don't include shift if it's not relevant
                                if (!ddlClass.SelectedValue.StartsWith("MCA"))
                                {
                                    command.Parameters.AddWithValue("@shift", selectedShift); // Only add shift for BCA/B.Tech
                                }
                                else
                                {
                                    command.Parameters.AddWithValue("@shift", DBNull.Value); // For MCA, no shift (nullable)
                                }
                                command.Parameters.AddWithValue("@day", ddlDay.SelectedValue);
                                command.Parameters.AddWithValue("@period_time", timings[i].Trim()); // Set period time for each insertion
                                command.Parameters.AddWithValue("@course_code", "3"); // Replace with actual course code if needed
                                command.Parameters.AddWithValue("@course_name", selectedCourse);
                                command.Parameters.AddWithValue("@subject", "3"); // Replace with actual subject
                                command.Parameters.AddWithValue("@teacher", teacherName); // Insert teacher name
                                command.Parameters.AddWithValue("@room_number", "3"); // Replace with actual room number

                                command.ExecuteNonQuery();
                            }
                        }

                        // Show success message
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccessMessage", "showSuccessMessage();", true);
                    }
                    catch (Exception ex)
                    {
                        // Handle any errors
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            else
            {
                // Handle the case where timing format is incorrect (e.g., show an error message)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorMessage", "showErrorMessage('Invalid timing format');", true);
            }
        }
    }
}
