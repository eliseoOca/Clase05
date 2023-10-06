<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarCategorias.aspx.cs" Inherits="Clase05.Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Menu</asp:HyperLink>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="302px"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Alta" Width="111px" />
&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nombreCategoria" DataValueField="idCategoria" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="216px"></asp:ListBox>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Width="221px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Baja" Width="108px" />
&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar" Width="106px" />
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Categorias] WHERE [idCategoria] = @idCategoria" InsertCommand="INSERT INTO [Categorias] ([nombreCategoria]) VALUES (@nombreCategoria)" SelectCommand="SELECT * FROM [Categorias]" UpdateCommand="UPDATE [Categorias] SET [nombreCategoria] = @nombreCategoria WHERE [idCategoria] = @idCategoria">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="idCategoria" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="nombreCategoria" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="nombreCategoria" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ListBox1" Name="idCategoria" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Categorias] WHERE ([idCategoria] = @idCategoria)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="idCategoria" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
