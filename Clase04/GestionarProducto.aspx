<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarProducto.aspx.cs" Inherits="Clase05.GestionarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Menu</asp:HyperLink>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="265px" placeholder ="Detalle" ToolTip="Cargar la Descripcion" onkeyup ="filtrarTabla()"></asp:TextBox>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombreCategoria" DataValueField="idCategoria" Width="199px" Height="29px">
            </asp:DropDownList>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Number" placeholder ="Precio" ToolTip="Cargar el Precio" Width="158px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" />
            &nbsp;<asp:Button ID="Button3" runat="server" Text="Modificar" OnClick="Button3_Click" />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="js-example-basic-single" DataSourceID="SqlDataSource2" DataTextField="descripcion" DataValueField="id" Width="542px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
&nbsp;<asp:Button ID="Button2" runat="server" OnClientClick="return Confirmar();" OnClick="Button2_Click" Text="Borrar" />
&nbsp;<br />
            <br />
            <br />
            <asp:Table ID="Table1" CssClass="table" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" GridLines="Both">
            </asp:Table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Categorias]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Productos] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT Productos.id, Productos.descripcion, Productos.idCategoria, Productos.precio, Categorias.nombreCategoria FROM Productos INNER JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Productos] WHERE [id] = @id" InsertCommand="INSERT INTO [Productos] ([descripcion], [idCategoria], [precio]) VALUES (@descripcion, @idCategoria, @precio)" SelectCommand="SELECT * FROM [Productos]" UpdateCommand="UPDATE [Productos] SET [descripcion] = @descripcion, [idCategoria] = @idCategoria, [precio] = @precio WHERE [id] = @id" >
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                    <asp:Parameter Name="precio" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCategoria" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox2" Name="precio" PropertyName="Text" Type="Decimal" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        function filtrarTabla() {
            let filtro = document.getElementById('TextBox1').value.toLowerCase();
            let tabla = document.getElementById('Table1');
            let filas = tabla.getElementsByTagName('tr');
            for (var i = 1; i < filas.length; i++) {
                var fila = filas[i];
                var celdas = fila.getElementsByTagName('td');
                var mostrarFila = false;
                for (var j = 0; j < celdas.length; j++) {
                    var celda = celdas[j];
                    if (celda) {
                        var contenido = celda.textContent || celda.innerText;
                        if (contenido.toLowerCase().indexOf(filtro) > -1) {
                            mostrarFila = true;
                            break;
                        }
                    }
                }
                fila.style.display = mostrarFila ? '' : 'none';
            }
        }


        function Confirmar() {
           return confirm('¿Estás seguro de que deseas eliminar este registro?');
        }

        document.addEventListener("DOMContentLoaded", function () {
            $(".js-example-basic-single").select2();
        });

    </script>
</body>
</html>
