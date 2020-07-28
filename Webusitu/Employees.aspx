<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Webusitu.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
    <br />
    <br />
    <br />
    <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click" />
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
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="lastnametxt" Display="Dynamic" ErrorMessage="*" />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        First Name :&nbsp; <asp:TextBox ID="firstnametxt" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        Last Name :&nbsp; <asp:TextBox ID="lastnametxt" runat="server" Height="16px"></asp:TextBox>
        <%---<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="telephonetxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailtxt" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="departmentDD" Display="Dynamic" ErrorMessage="*" />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        Telephone:&nbsp;&nbsp;
        <asp:TextBox ID="telephonetxt" runat="server"></asp:TextBox>&nbsp;
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="firstnametxt" Display="Dynamic" ErrorMessage="*" />--%>

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
    <div id="updateDiv" runat="server">
    <asp:Label ID="enteremplbl0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Enter Employee ID To Update"></asp:Label>
    
        <br />
        <br />
        ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="updateIDtxt" runat="server"></asp:TextBox>
        <br />
        <br />
    </div>
    <div id="updateDiv1" runat="server">
        <asp:Label ID="updateFnamelbl" runat="server" Text="First Name :"></asp:Label>
        &nbsp; <asp:TextBox ID="firstnametxt0" runat="server" Height="19px"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        <asp:Label ID="updateLnamelbl" runat="server" Text="Last Name :"></asp:Label>
        &nbsp; <asp:TextBox ID="lastnametxt0" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="lastnametxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        <asp:Label ID="updateEmaillbl" runat="server" Text="Email : "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailtxt0" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <asp:Label ID="updatetelephonelbl" runat="server" Text="Telephone :"></asp:Label>
        &nbsp;
        <asp:TextBox ID="telephonetxt0" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="telephonetxt" Display="Dynamic" ErrorMessage="*" />

        <br />
        <br />
        Leave Amount:
        <asp:TextBox ID="leaveAmttxt" runat="server"></asp:TextBox>

        <br />
        <br />
        <asp:Label ID="updateDepartmentlbl" runat="server" Text="Department :"></asp:Label>
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="updateEmpbtn" runat="server" Text="Submit" OnClick="updateEmpbtn_Click" />
        </div>
    <br />
        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
    <br />
    </asp:Content>
