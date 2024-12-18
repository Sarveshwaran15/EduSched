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
    public partial class FacultyTable : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ensure all timing fields are hidden on first load
                shiftField.Visible = false;
                gvSchedule.Visible = false;
            }

        }
        // Handle class selection and display shift or MCA timings
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedClass = ddlClass.SelectedValue;

            if (selectedClass.Contains("BCA"))
            {
                // Show shift dropdown for BCA classes
                shiftField.Visible = true;
            }
            else if (selectedClass.Contains("MCA") || selectedClass == "B.Tech CS")
            {
                // Hide shift dropdown for MCA and B.Tech CS classes
                shiftField.Visible = false;
            }
            else
            {
                // Hide all timing fields if no class is selected
                shiftField.Visible = false;
            }
        }
        // Handle submit button click to fetch schedule
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string selectedClass = ddlClass.SelectedValue;
            string selectedShift = ddlShift.SelectedValue;

            // Fetch and bind schedule data
            BindScheduleGrid(selectedClass, selectedShift);
        }

        private void BindScheduleGrid(string className, string shift)
        {
            SqlCommand cmd;

            if (className.Contains("MCA") || className == "B.Tech CS")
            {
                cmd = new SqlCommand(@"
                SELECT day, period_time, course_code, course_name, teacher 
                FROM timetableClass 
                WHERE year_class = @className 
                ORDER BY 
                    CASE day 
                        WHEN 'Monday' THEN 1 
                        WHEN 'Tuesday' THEN 2 
                        WHEN 'Wednesday' THEN 3 
                        WHEN 'Thursday' THEN 4 
                        WHEN 'Friday' THEN 5 
                        ELSE 6 
                    END", con);

                cmd.Parameters.AddWithValue("@className", className);
            }
            else
            {
                cmd = new SqlCommand(@"
                SELECT day, period_time, course_code, course_name, teacher 
                FROM timetableClass 
                WHERE year_class = @className AND shift = @shift 
                ORDER BY 
                    CASE day 
                        WHEN 'Monday' THEN 1 
                        WHEN 'Tuesday' THEN 2 
                        WHEN 'Wednesday' THEN 3 
                        WHEN 'Thursday' THEN 4 
                        WHEN 'Friday' THEN 5 
                        ELSE 6 
                    END", con);

                cmd.Parameters.AddWithValue("@className", className);
                cmd.Parameters.AddWithValue("@shift", shift);
            }
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSchedule.DataSource = dt;
                gvSchedule.DataBind(); // Bind the result to the GridView
                gvSchedule.Visible = true; // Show the GridView
            }
            catch (Exception ex)
            {
                // Handle exception (log the error or show an error message)
                // Response.Write($"Error: {ex.Message}");
            }
            finally
            {
                con.Close();
            }
        }
        }
    }