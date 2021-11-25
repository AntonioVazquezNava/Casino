<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Casino.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Casino</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Users<br />
            <asp:Panel ID="Panel1" runat="server">
            <table>
                <tr>
                    <td>Username</td>
                    <td><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" /></td>
                    <td></td>
                </tr>
            </table>
            </asp:Panel>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" >
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:ButtonField CommandName="cmdDelete" Text="Delete" />
                <asp:ButtonField CommandName="cmdEdit" Text="Edit" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CasinoConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
            <asp:Panel ID="Panel2" runat="server">
            <table>
                <tr>
                    <td>Username</td>
                    <td><asp:TextBox ID="txtUserNameEdit" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><asp:TextBox ID="txtPasswordEdit" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td><asp:TextBox ID="txtFirstNameEdit" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><asp:TextBox ID="txtLastNameEdit" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnClean" runat="server" Text="Clean" OnClick="btnClean_Click" /></td>
                    <td><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /></td>
                </tr>
            </table>
            </asp:Panel>
    </form>
</body>
</html>
