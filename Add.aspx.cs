using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Configuration;
using System.Text;
using System.Globalization;

namespace schedule
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStaffNames();
            }

        }
        private void LoadStaffNames()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                string query = "SELECT DISTINCT teacher FROM timetableClass";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlStaff.DataSource = reader;
                    ddlStaff.DataTextField = "teacher";
                    ddlStaff.DataValueField = "teacher";
                    ddlStaff.DataBind();
                }
            }

            ddlStaff.Items.Insert(0, new ListItem("-- Select Staff --", "0"));
        }

        // Button click event to filter data based on selected staff
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (ddlStaff.SelectedValue != "0")
            {
                DisplayStaffSchedule(ddlStaff.SelectedValue);
            }
        }

        // Display staff schedule, total classes, and total hours
        private void DisplayStaffSchedule(string teacherName)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                string query = @"
                SELECT course_code, course_name, subject, day, period_time, room_number
                FROM timetableClass
                WHERE teacher = @TeacherName";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TeacherName", teacherName);
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewSchedule.DataSource = dt;
                    GridViewSchedule.DataBind();

                    // Calculate total classes and total hours worked
                    int totalClasses = dt.Rows.Count;
                    double totalHours = 0;

                    foreach (DataRow row in dt.Rows)
                    {
                        string periodTime = row["period_time"].ToString();
                        totalHours += CalculateDuration(periodTime);
                    }

                    lblTotalClasses.Text = "Total Classes: " + totalClasses + " | Total Hours: " + totalHours.ToString("F2");
                }
            }
        }

        // Helper method to calculate duration from "start - end" format in period_time
        private double CalculateDuration(string periodTime)
        {
            if (string.IsNullOrWhiteSpace(periodTime))
                return 0;

            string[] times = periodTime.Split('-');
            if (times.Length != 2)
                return 0;

            DateTime startTime;
            DateTime endTime;

            if (DateTime.TryParseExact(times[0].Trim(), "H:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out startTime) &&
                DateTime.TryParseExact(times[1].Trim(), "H:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out endTime))
            {
                TimeSpan duration = endTime - startTime;
                return duration.TotalHours;
            }

            return 0;
        }

    }
}