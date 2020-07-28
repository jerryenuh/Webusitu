<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="Webusitu.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %><asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
    </h2>
    <h2>Apply For Leave Down Below.</h2>
    <p>&nbsp;</p>
    <script  type="text/javascript">
        function validate() {
            confirm("Press Ok To Confirm?"); lue;
            
        }
    </script>
     
    
    <div>
        <label>ID</label>
        <asp:TextBox ID="txtID" runat="server" />
        <asp:Label ID="errorlbl" runat="server" Text="" BackColor="White" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
        
        <br />
        <asp:Button ID="idsubmitbtn" runat="server" OnClick="idsubmitbtn_Click" Text="Search" />
        <br />
    </div>
    <div id="leavediv" runat="server">
        <label>Leave Day/s amount</label>
        <asp:TextBox ID="txtDays" runat="server" AutoPostBack="True" OnTextChanged="txtDays_TextChanged" >0</asp:TextBox>
        
        <br />
        <br />
    </div>
    <div id="datediv" runat="server">
        <label>Start Date</label>&nbsp;
        <asp:TextBox ID="startdate" runat="server" Width="129px" OnTextChanged="startdate_TextChanged" placeholder ="mm/dd/yyyy"></asp:TextBox>

        <label>
        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Width="22px" ImageUrl="~/Content/Calendar.png" />
        </label>
        

        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Date</label>&nbsp;
        <asp:TextBox ID="enddatetxt" runat="server" ReadOnly="True"></asp:TextBox>
        <asp:Calendar ID="calendar" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
        <asp:Label ID="errorlbl2" runat="server" ForeColor="Red"></asp:Label>
        <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT * FROM [leaves]"></asp:SqlDataSource>
        <br />
        

    </div>
    <div id="submitdiv" runat="server">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Info" OnClick="btnSubmit_Click" OnClientClick="validate();"/>
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
