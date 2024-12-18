using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace schedule
{
    public partial class PrintTimetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial setup if needed
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string selectedClass = ddlClass.SelectedValue;
            string selectedShift = ddlShift.SelectedValue;

            if (string.IsNullOrEmpty(selectedClass))
            {
                lblMessage.Text = "Please select a class.";
                lblMessage.Visible = true;
                return;
            }

            if (selectedClass.StartsWith("BCA") && string.IsNullOrEmpty(selectedShift))
            {
                lblMessage.Text = "Please select a shift for BCA.";
                lblMessage.Visible = true;
                return;
            }

            lblMessage.Visible = false;
            LoadTimetable(selectedClass, selectedShift);
        }

        private void LoadTimetable(string selectedClass, string selectedShift)
        {
            DataTable dt = GetTimetableData(selectedClass, selectedShift);

            // Determine headers based on the class and shift
            string[] headers = GetHeadersBasedOnClassAndShift(selectedClass, selectedShift);

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

            // Populate table rows with data from database
            string[] weekDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" };

            foreach (string day in weekDays)
            {
                TableRow tableRow = new TableRow();
                TableCell dayCell = new TableCell { Text = day };
                tableRow.Cells.Add(dayCell);

                // Get the data for the current day from the DataTable
                DataRow[] dayRows = dt.Select($"day = '{day}'");

                // Iterate over each period time (header) and find the course for this period
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

        private DataTable GetTimetableData(string selectedClass, string selectedShift)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                string query = "SELECT day, period_time, course_name FROM timetableClass WHERE year_class = @Class";
                if (selectedClass.StartsWith("BCA") && !string.IsNullOrEmpty(selectedShift))
                {
                    query += " AND shift = @Shift";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Class", selectedClass);
                    if (selectedClass.StartsWith("BCA") && !string.IsNullOrEmpty(selectedShift))
                    {
                        cmd.Parameters.AddWithValue("@Shift", selectedShift);
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            foreach (DataRow row in dt.Rows)
            {
                Console.WriteLine($"Day: {row["day"]}, Period Time: {row["period_time"]}, Course Name: {row["course_name"]}");
            }

            return dt;
        }

        private string[] GetHeadersBasedOnClassAndShift(string selectedClass, string selectedShift)
        {
            if (selectedClass.StartsWith("BCA"))
            {
                if (selectedShift == "Shift 1")
                {
                    return new string[] { "8:30 - 9:20", "9:20 - 10:10", "10:10 - 11:00", "11:30 - 12:20", "12:20 - 1:10" };
                }
                else if (selectedShift == "Shift 2")
                {
                    return new string[] { "11:30 - 12:20", "12:20 - 1:10", "1:40 - 2:30", "2:30 - 3:20", "3:20 - 4:10" };
                }
            }
            else if (selectedClass.StartsWith("MCA"))
            {
                return new string[] { "8:30 - 9:25", "9:25 - 10:20", "10:40 - 11:35", "11:35 - 12:30", "1:15 - 2:10", "2:10 - 3:05" };
            }

            return new string[] { };
        }
    }
}