<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateEmp.aspx.cs" Inherits="Webusitu.UpdateEmp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <br />
    <br />
    
    <div id="updateDiv" runat="server">
    <asp:Label ID="enteremplbl0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Enter Employee ID To Update"></asp:Label>
    
        <br />
        <br />
        ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox CssClass="form-control" ID="updateIDtxt" runat="server"></asp:TextBox>
        <span>
    
   <asp:Label ID="errorlbl" runat="server" Font-Bold="True"></asp:Label>
        </span>
        <br />
        <br />
    </div>
    <div id="updateDiv1" runat="server">
        <asp:Label ID="updateFnamelbl" runat="server" Text="First Name :"></asp:Label>
        &nbsp; <asp:TextBox CssClass="form-control" ID="firstnametxt0" runat="server" Height="35px"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        <asp:Label ID="updateLnamelbl" runat="server" Text="Last Name :"></asp:Label>
        &nbsp; <asp:TextBox CssClass="form-control" ID="lastnametxt0" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="lastnametxt" Display="Dynamic" ErrorMessage="*" />--%>
        <br />
        <br />
        <asp:Label ID="updateEmaillbl" runat="server" Text="Email : "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox CssClass="form-control" ID="emailtxt0" runat="server"></asp:TextBox>
        <%--- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="emailtxt" Display="Dynamic" ErrorMessage="*" />--%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <asp:Label ID="updatetelephonelbl" runat="server" Text="Telephone :"></asp:Label>
        &nbsp;
        <asp:TextBox CssClass="form-control" ID="telephonetxt0" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="telephonetxt0" Display="Dynamic" ErrorMessage="*" />

        <br />
        <br />
        Leave Amount:
        <asp:TextBox CssClass="form-control" ID="leaveAmttxt" runat="server"></asp:TextBox>

        <br />
        <br />
        <asp:Label ID="updateDepartmentlbl" runat="server" Text="Department :"></asp:Label>
&nbsp;<asp:DropDownList CssClass="form-control" ID="updateDropDown" runat="server" DataSourceID="SqlDataSource3" DataTextField="Id" DataValueField="Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Id] FROM [Department]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button CssClass="btn btn-info" ID="updateEmpbtn" runat="server" Text="Submit" OnClick="updateEmpbtn_Click" />
        </div>
    <br />
        <asp:Button CssClass="btn btn-info" ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
    <br />

</asp:Content>
