using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration; /// Extracts values from Web.config when connection is made.

/// <summary>
/// This file is for the button Save.
/// Interesting that C# uses 3 forward slashes for comments.
/// </summary>
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["sampConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand("procinsert", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@email", TextBox2.Text);
        cmd.Parameters.AddWithValue("@datasaved", Calendar1.SelectedDate);

        try {
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        catch(Exception ex) {
            Response.Write(ex.Message);
        }

        finally {
            conn.Close();
        }

        GridView1.DataBind();
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox3.Text = Calendar1.SelectedDate.ToShortDateString();
    }
}