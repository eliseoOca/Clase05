using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clase05
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                actualizarLabel();   
            }
        }

        protected void actualizarLabel()
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            StringBuilder tablaHtml = new StringBuilder();

            tablaHtml.Append("<table border='1'>");
            tablaHtml.Append("<tr>");
            tablaHtml.Append("<th>Categorias</th>");
            tablaHtml.Append("</tr>");

            foreach (DataRowView rowView in dv)
            {
                DataRow row = rowView.Row;
                tablaHtml.Append("<tr>");
                tablaHtml.AppendFormat("<td>{0}</td>", row["nombreCategoria"].ToString());
                tablaHtml.Append("</tr>");
            }

            tablaHtml.Append("</table>");

            Label2.Text = tablaHtml.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //SqlDataSource1.InsertParameters["nombreCategoria"].DefaultValue = TextBox1.Text;
                int result = SqlDataSource1.Insert();
                if (result > 0)
                {
                    Label1.Text = "Agregado " + result.ToString() + " registro.";
                    actualizarLabel();
                }
                else
                {
                    Label1.Text = "No se agregaron registros.";
                }
            }
            catch(SqlException)
            {
                Label1.Text = "Complete todos los datos";
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                //SqlDataSource1.InsertParameters["nombreCategoria"].DefaultValue = TextBox1.Text;
                int result = SqlDataSource1.Delete();
                if (result > 0)
                {
                    Label1.Text = "Borrado " + result.ToString() + " registro.";
                    actualizarLabel();
                }
                else
                {
                    Label3.Text = "No se borro el registro.";
                }
            }
            catch (SqlException)
            {
                Label3.Text = "Se ha producido un error";

            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                TextBox2.Text = reader["nombreCategoria"].ToString();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                int result = SqlDataSource1.Update();
                if (result > 0)
                {
                    Label3.Text = "Actualizado " + result.ToString() + " registro.";
                    actualizarLabel();
                }
                else
                {
                    Label3.Text = "No se actualizo el registro.";
                }
            }
            catch (SqlException)
            {
                Label3.Text = "Se ha producido un error";

            }
        }
    }
}