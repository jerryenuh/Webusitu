<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Webusitu.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
    <br />
    <br />
    <asp:Label ID="enteremplbl" runat="server" Font-Bold="True" Font-Size="20pt" Text="Enter Employees Below "></asp:Label>
    <br />
    <div>
        ID:
        <asp:TextBox ID="IDtxt" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name :
        <asp:TextBox ID="nametxt" runat="server"></asp:TextBox>
        <br />
        <br />
        Email:
        <asp:TextBox ID="emailtxt" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telephone:
        <asp:TextBox ID="telephonetxt" runat="server"></asp:TextBox>
        <br />
        <br />
        Department:
        <asp:TextBox ID="departmenttxt" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JobTitle:
        <asp:TextBox ID="jobtitletxt" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
    </div>
</asp:Content>
