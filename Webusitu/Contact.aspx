<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Webusitu.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
        <asp:Label ID="connlbl" runat="server" Text="Label"></asp:Label>
    </h2>
    <h3>Apply For Leave Down Below.</h3>
   <!-- <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address> -->
    <div>
        <label>ID</label>
        <asp:TextBox ID="txtID" runat="server" />
        <br />
        <br />
    </div>
    <div>
        <label>Leave Day/s amount</label>
        <asp:TextBox ID="txtDays" runat="server" />
        <br />
        <br />
    </div>
    <div>
        <label>Start Date</label>
        <input type="date" data-date-inline-picker="true" runat="server" id="startdate"/>

        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Date</label>
        <input type="date" data-date-inline-picker="true" runat="server" id="enddate" /><br />
        <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT * FROM [leaves]"></asp:SqlDataSource>
        <br />
        

    </div>
    <div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Info" OnClick="btnSubmit_Click"/>
    </div>
   <!-- <div class="message">
        <asp:Literal ID="ItMessage" runat="server" />
    </div>
    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address> -->
</asp:Content>
