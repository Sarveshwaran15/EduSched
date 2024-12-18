using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace schedule
{
    public partial class AddLab : System.Web.UI.Page
    {
        private DataTable LabsTable
        {
            get
            {
                // Check if LabsTable already exists in ViewState
                if (ViewState["LabsTable"] == null)
                {
                    // Create a new DataTable with columns if it doesn't exist
                    DataTable dt = new DataTable();
                    dt.Columns.Add("LabName");
                    dt.Columns.Add("Location");
                    dt.Columns.Add("Tools");
                    ViewState["LabsTable"] = dt;
                }
                return (DataTable)ViewState["LabsTable"];
            }
            set
            {
                ViewState["LabsTable"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate Location dropdown
                ddlLocation.Items.Add("PKC");
                ddlLocation.Items.Add("Main Block");
                ddlLocation.Items.Add("Education Block");

                // Populate Tools dropdown with coding platforms and IDE names
                ddlTools.Items.Add("Visual Studio");
                ddlTools.Items.Add("Eclipse");
                ddlTools.Items.Add("PyCharm");
                ddlTools.Items.Add("IntelliJ IDEA");
                ddlTools.Items.Add("NetBeans");
                ddlTools.Items.Add("Jupyter Notebook");

                // Bind the GridView to an empty DataTable on first load
                BindGrid();
            }

        }
        protected void btnAddLab_Click(object sender, EventArgs e)
        {
            // Get values from form fields
            string labName = txtLabName.Text;
            string location = ddlLocation.SelectedValue;  // Use SelectedValue for dropdown
            string tools = ddlTools.SelectedValue;        // Use SelectedValue for dropdown

            // Add the new lab to the DataTable
            DataRow newRow = LabsTable.NewRow();
            newRow["LabName"] = labName;
            newRow["Location"] = location;
            newRow["Tools"] = tools;
            LabsTable.Rows.Add(newRow);

            // Re-bind the GridView to reflect the new data
            BindGrid();

            // Clear the input fields
            txtLabName.Text = "";
            ddlLocation.SelectedIndex = 0;
            ddlTools.SelectedIndex = 0;
        }
        private void BindGrid()
        {
            gvLabs.DataSource = LabsTable;
            gvLabs.DataBind();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the connection string from Web.config


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString()))
            {
                con.Open();

                // Loop through each row in the LabsTable and insert into the database
                foreach (DataRow row in LabsTable.Rows)
                {
                    string labName = row["LabName"].ToString();
                    string location = row["Location"].ToString();
                    string tools = row["Tools"].ToString();

                    string query = "INSERT INTO Labs (LabName, Location, Tools) VALUES (@LabName, @Location, @Tools)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the query
                        cmd.Parameters.AddWithValue("@LabName", labName);
                        cmd.Parameters.AddWithValue("@Location", location);
                        cmd.Parameters.AddWithValue("@Tools", tools);

                        // Execute the insert command
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            // Clear the LabsTable and re-bind the GridView
            LabsTable.Clear();
            BindGrid();

            // Optionally, display a message to confirm submission
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data submitted successfully!');", true);

        }
    }
}