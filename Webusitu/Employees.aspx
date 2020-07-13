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
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="IDtxt" Display="Dynamic" ErrorMessage="Please Enter An ID Number" />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name :
        <asp:TextBox ID="nametxt" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="nametxt" Display="Dynamic" ErrorMessage="Please Enter Your Name" />
        <br />
        <br />
        Email:
        <asp:TextBox ID="emailtxt" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="Please Enter Your Email" />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telephone:
        <asp:TextBox ID="telephonetxt" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="telephonetxt" Display="Dynamic" ErrorMessage="Please Enter Your Telephone Number" />

        <br />
        <br />
        Department:
        <asp:TextBox ID="departmenttxt" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="departmenttxt" Display="Dynamic" ErrorMessage="Please Enter Your Department" />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JobTitle:
        <asp:TextBox ID="jobtitletxt" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="jobtitletxt" Display="Dynamic" ErrorMessage="Please Enter Your Occupation " />

        <br />
        <br />
        <asp:Label ID="errorlbl" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
    </div>
</asp:Content>
