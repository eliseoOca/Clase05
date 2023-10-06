using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clase05
{
    public partial class GestionarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completarTabla();
            }
        }

        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView) SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                
                
                if (dv != null && dv.Count >0)
                {
                    // Rellenar cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Descripcion";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Categoria";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Precio";
                    headerRow.Cells.Add(headerCell3);

                    Table1.Rows.Add(headerRow);

                    // Rellenar las filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["nombreCategoria"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["precio"].ToString();
                        tableRow.Cells.Add(cell3);

                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource2.InsertParameters["descripcion"].DefaultValue = TextBox1.Text;
            SqlDataSource2.InsertParameters["idCategoria"].DefaultValue = DropDownList1.SelectedValue;
            SqlDataSource2.InsertParameters["precio"].DefaultValue = TextBox2.Text;
            int result = SqlDataSource2.Insert();
            if (result > 0)
            {
                Label2.Text = "Agregado " + result.ToString() + " registro.";
                completarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No se agregaron registros.";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource2.Delete();
            if (result > 0)
            {

                Label2.Text = "Borrado " + result.ToString() + " registro.";
                completarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No se borraron registros.";
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["descripcion"].ToString();
                DropDownList1.SelectedValue = row["idCategoria"].ToString();
                TextBox2.Text = row["precio"].ToString();
            }
            completarTabla();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource2.UpdateParameters["id"].DefaultValue = DropDownList2.SelectedValue;
            int result = SqlDataSource2.Update();

            if (result > 0)
            {

                Label2.Text = "Actualizado " + result.ToString() + " registro.";
                completarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No se actualizaron registros.";
            }
        }
    }
}