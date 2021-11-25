using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Casino
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            search();
        }


        protected void search()
        {
            String strConnString = ConfigurationManager.ConnectionStrings["CasinoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_Select_User";
            cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = txtUserName.Text.Trim();
            cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = txtPassword.Text.Trim();
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstName.Text.Trim();
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLastName.Text.Trim();

            cmd.Connection = con;

            try
            {
                con.Open();
                GridView1.EmptyDataText = "No Records Found";
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            search();
        }

        protected void btnClean_Click(object sender, EventArgs e)
        {
            txtUserNameEdit.Text = string.Empty;
            txtPasswordEdit.Text = string.Empty;
            txtFirstNameEdit.Text = string.Empty;
            txtLastNameEdit.Text = string.Empty;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtUserNameEdit.Text.Trim() != String.Empty)
            {
                String strConnString = ConfigurationManager.ConnectionStrings["CasinoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_Save_User";
                cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = txtUserNameEdit.Text.Trim();
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = txtPasswordEdit.Text.Trim();
                cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstNameEdit.Text.Trim();
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLastNameEdit.Text.Trim();

                cmd.Connection = con;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    search();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "cmdEdit")
                {
                    txtUserNameEdit.Text = GridView1.Rows[index].Cells[0].Text;
                    txtPasswordEdit.Text = GridView1.Rows[index].Cells[1].Text;
                    txtFirstNameEdit.Text = GridView1.Rows[index].Cells[2].Text;
                    txtLastNameEdit.Text = GridView1.Rows[index].Cells[3].Text;
                }
                else if (e.CommandName == "cmdDelete")
                {
                    string strUserName = GridView1.Rows[index].Cells[0].Text;
                    String strConnString = ConfigurationManager.ConnectionStrings["CasinoConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(strConnString);
                    SqlCommand cmd = new SqlCommand();

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_Delete_User";
                    cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = strUserName.Trim();

                    cmd.Connection = con;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        search();
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ee)
            {
                string message = ee.Message;
            }
        }
    }
}