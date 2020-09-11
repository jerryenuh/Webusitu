<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="Webusitu.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
        <script  type="text/javascript">
            function validate() {
                confirm("Press Ok To Confirm?"); lue;

            }
        </script>
    

    <h2><%: Title %>
    </h2>
    <br />
    <br />
    <h2>Apply For Leave Down Below.</h2>
    <p>&nbsp;</p>
    
     
    
    <div>
        <label>ID</label>
        <asp:TextBox CssClass="form-control" ID="txtID" runat="server" AutoPostBack="True" BorderStyle="Solid" Width="152px" />
        <asp:Label ID="errorlbl" runat="server" Text="" BackColor="White" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
        
        <br />
        <asp:Button CssClass="btn btn-info" ID="idsubmitbtn" runat="server" AutoPostBack="True" OnClick="idsubmitbtn_Click" Text="Search" ForeColor="#333333" />
        <br />
    </div>
    <div id="leavediv" runat="server">
        <label>Leave Day/s amount</label>
        <asp:TextBox CssClass="form-control" ID="txtDays" runat="server" AutoPostBack="True" OnTextChanged="txtDays_TextChanged" >0</asp:TextBox>
        
        <br />
    </div>
    <div id="datediv" runat="server">
        <label>Start Date</label>&nbsp;
        <asp:TextBox CssClass="form-control" ID="startdate" runat="server" Width="129px"  AutoPostBack="True" OnTextChanged="startdate_TextChanged" placeholder ="mm/dd/yyyy"></asp:TextBox>

        <span>

        
        <asp:ImageButton  ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Width="22px" ImageUrl="~/Content/Calendar.png" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="startdate" PopupButtonID="calendarimg" DefaultView="Days" Format="MM/dd/yyyy" OnClientDateSelectionChanged="checkDate"  />
        
        <asp:Calendar ID="calendar" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>

        
        <br />
        <br />
        
        

        </span>
        <label>End Date</label>&nbsp;
        <asp:TextBox ID="enddatetxt" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="errorlbl2" runat="server" ForeColor="Red"></asp:Label>
        <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT * FROM [leaves]"></asp:SqlDataSource>
        <br />
        

    </div>
    <div id="submitdiv" runat="server">
        <asp:Button CssClass="btn btn-info" ID="btnSubmit" runat="server" Text="Submit Info" OnClick="btnSubmit_Click" OnClientClick="validate();" ForeColor="Black"/>
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
