<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Clase05.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestionarCategorias.aspx">Gestionar Categoria</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/GestionarProducto.aspx">Gestionar Producto</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
