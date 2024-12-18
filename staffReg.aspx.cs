using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace schedule
{
    public partial class staffReg : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Create the DataTable structure
                dt.Columns.Add("StaffID");
                dt.Columns.Add("StaffName");
                dt.Columns.Add("Degree");
                dt.Columns.Add("Designation");
                dt.Columns.Add("Specialization");
                dt.Columns.Add("AreaOfInterest");

                ViewState["StaffDetails"] = dt; // Save to ViewState for persistence across postbacks
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve the data from the ViewState
            dt = (DataTable)ViewState["StaffDetails"];

            // Add new row with the selected values
            DataRow row = dt.NewRow();
            row["StaffID"] = txtStaffID.Text;
            row["StaffName"] = txtStaffName.Text;
            row["Degree"] = txtDegree.Text;
            row["Designation"] = ddlDesignation.SelectedValue;
            row["Specialization"] = ddlSpecialization.SelectedValue;
            row["AreaOfInterest"] = ddlAreaOfInterest.SelectedValue;

            dt.Rows.Add(row); // Add the row to the DataTable
            ViewState["StaffDetails"] = dt; // Store the updated table in ViewState

            // Bind the GridView with updated data
            gvStaffDetails.DataSource = dt;
            gvStaffDetails.DataBind();

            // Clear the input fields
            ClearFields();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // Get the data from ViewState
            dt = (DataTable)ViewState["StaffDetails"];

            // Connection string to your SQL Server database
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()); // Replace with your connection string


            con.Open();
            foreach (DataRow row in dt.Rows)
            {
                string query = "INSERT INTO StaffDetails (StaffID, StaffName, Degree, Designation, Specialization, AreaOfInterest) " +
                               "VALUES (@StaffID, @StaffName, @Degree, @Designation, @Specialization, @AreaOfInterest)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@StaffID", row["StaffID"]);
                    cmd.Parameters.AddWithValue("@StaffName", row["StaffName"]);
                    cmd.Parameters.AddWithValue("@Degree", row["Degree"]);
                    cmd.Parameters.AddWithValue("@Designation", row["Designation"]);
                    cmd.Parameters.AddWithValue("@Specialization", row["Specialization"]);
                    cmd.Parameters.AddWithValue("@AreaOfInterest", row["AreaOfInterest"]);

                    cmd.ExecuteNonQuery();
                }

            }

            // Optionally, you can clear the GridView and the ViewState after insertion
            dt.Clear();
            gvStaffDetails.DataSource = null;
            gvStaffDetails.DataBind();
            ViewState["StaffDetails"] = dt;
        }

        private void ClearFields()
        {
            txtStaffID.Text = "";
            txtStaffName.Text = "";
            txtDegree.Text = "";
            ddlDesignation.SelectedIndex = 0;
            ddlSpecialization.SelectedIndex = 0;
            ddlAreaOfInterest.SelectedIndex = 0;
        }

    }
}