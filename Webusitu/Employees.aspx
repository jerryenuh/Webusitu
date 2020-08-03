<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Webusitu.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="addEmployeeBtn" runat="server" OnClick="addEmployeeBtn_Click" Text="Add" />
    <br />
    <br />
    
    <div id="addEmployeeDiv" style="margin-top: 0px" runat="server">
    <asp:Label ID="enteremplbl" runat="server" Font-Bold="True" Font-Size="20pt" Text="Enter Employees Below "></asp:Label>
    
        <br />
        <br />
        ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="IDtxt" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        First Name :&nbsp; <asp:TextBox ID="firstnametxt" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="lastnametxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        Last Name :&nbsp; <asp:TextBox ID="lastnametxt" runat="server" Height="22px"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailtxt" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="lastnametxt" Display="Dynamic" ErrorMessage="*" />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        Telephone:&nbsp;&nbsp;
        <asp:TextBox ID="telephonetxt" runat="server"></asp:TextBox>&nbsp;
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>

        <br />
        <br />
        Department:&nbsp;
        <asp:DropDownList ID="departmentDD" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="lastnametxt" Display="Dynamic" ErrorMessage="*" />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        
        <br />
        <br />
        <asp:Label ID="errorlbl" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
    
    </div>
    
    
    <br />
    </asp:Content>
