<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="Webusitu.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
    </h2>
    <h3>Apply For Leave Down Below.</h3>
    <div>
        <label>ID</label>
        <asp:TextBox ID="txtID" runat="server" />
        <asp:Label ID="errorlbl" runat="server" Text="" BackColor="White" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="rfID" ControlToValidate="txtID" ErrorMessage="Please Enter ID Number" />
        <br />
        <asp:Button ID="idsubmitbtn" runat="server" OnClick="idsubmitbtn_Click" Text="Search" />
        <br />
    </div>
    <div id="leavediv" runat="server">
        <label>Leave Day/s amount</label>
        <asp:TextBox ID="txtDays" runat="server" />
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtDays" ErrorMessage="Please Enter Amount of Vaction Days Required" />
        <br />
        <br />
    </div>
    <div id="datediv" runat="server">
        <label>Start Date</label>
        <input type="date" data-date-inline-picker="true" runat="server" id="startdate"/>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="startdate" Display="Dynamic" ErrorMessage="Please a beginning date" />

        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Date</label>&nbsp;
        <asp:TextBox ID="enddatetxt" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT * FROM [leaves]"></asp:SqlDataSource>
        <br />
        

    </div>
    <div id="submitdiv" runat="server">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Info" OnClick="btnSubmit_Click"/>
        <asp:Label ID="testlbl" runat="server"></asp:Label>
    </div>
   <!-- <div class="message">
        <asp:Literal ID="ItMessage" runat="server" />
    </div>
    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address> -->
</asp:Content>
