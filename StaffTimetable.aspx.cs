using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Linq;


namespace schedule
{
    public partial class StaffTimetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initial setup if needed
            }
        
    }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string staffName = txtStaffName.Text.Trim();

            if (string.IsNullOrEmpty(staffName))
            {
                lblMessage.Text = "Please enter a staff name.";
                lblMessage.Visible = true;
                return;
            }

            lblMessage.Visible = false;
            LoadTimetable(staffName);
        }

        private void LoadTimetable(string staffName)
        {
            DataTable dt = GetTimetableData(staffName);

            if (dt.Rows.Count == 0)
            {
                lblMessage.Text = "No timetable found for the given staff name.";
                lblMessage.Visible = true;
                timetableContainer.Style["display"] = "none";
                return;
            }

            // Get the year_class for the matched staff
            string yearClass = dt.Rows[0]["year_class"].ToString();

            // Set the year/class label
            lblYearClass.Text = yearClass;

            // Load the timetable in MCA format
            string[] headers = new string[] { "8:30 - 9:25", "9:25 - 10:20", "10:40 - 11:35", "11:35 - 12:30", "1:15 - 2:10", "2:10 - 3:05" };

            // Clear existing rows
            tblTimetable.Rows.Clear();

            // Create table headers dynamically
            TableHeaderRow headerRow = new TableHeaderRow();
            TableHeaderCell dayHeader = new TableHeaderCell { Text = "Day" };
            headerRow.Cells.Add(dayHeader);

            foreach (string header in headers)
            {
                TableHeaderCell headerCell = new TableHeaderCell { Text = header };
                headerRow.Cells.Add(headerCell);
            }
            tblTimetable.Rows.Add(headerRow);

            // Define week days
            string[] weekDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" };

            foreach (string day in weekDays)
            {
                TableRow tableRow = new TableRow();
                TableCell dayCell = new TableCell { Text = day };
                tableRow.Cells.Add(dayCell);

                // Get the data for the current day from the DataTable
                DataRow[] dayRows = dt.Select($"day = '{day}'");

                foreach (string periodTime in headers)
                {
                    TableCell periodCell = new TableCell();

                    // Find the course for the current period time and day
                    DataRow periodRow = dayRows.FirstOrDefault(row => row["period_time"].ToString().Trim() == periodTime.Trim());
                    if (periodRow != null)
                    {
                        periodCell.Text = periodRow["course_name"].ToString(); // Display the course name
                    }
                    else
                    {
                        periodCell.Text = "-"; // Show a dash if no course is scheduled
                    }

                    tableRow.Cells.Add(periodCell);
                }

                tblTimetable.Rows.Add(tableRow);
            }

            timetableContainer.Style["display"] = "block";
        }

        private DataTable GetTimetableData(string staffName)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                string query = "SELECT day, period_time, course_name, year_class FROM timetableClass WHERE teacher = @StaffName";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@StaffName", staffName);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }
    }
}