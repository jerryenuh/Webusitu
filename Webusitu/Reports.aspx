<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Webusitu.Reports" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $(function () {
          $("#tabs").tabs();
          

      });
  </script>

    
    

    <div id="tabs">
        <div id="tabbs" runat="server">
  <ul>
    <li id="list1"><a href="#tabs-1">List Employees</a></li>
    
    <li id="list2"><a href="#tabs-3">List of Leave Records</a></li>
  </ul>
            </div>
        <div id="tabs_11" runat="server">
  <div id="tabs-1">
      <br />
      <br />
         <rsweb:ReportViewer ID="ReportViewer2" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" SizeToReportContent="True" PromptAreaCollapsed="True">
        <localreport reportpath="Report2.rdlc">
            <datasources>   
                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet1" />
            </datasources>
        </localreport>
    </rsweb:ReportViewer>
  </div>
            </div>
  <div id="tabs-2">
        
  </div>
 
</div>

    <div id="tabs3" runat="server">
<div id="tabs2" runat="server">
     <div id="tabs-3">
     
      <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" SizeToReportContent="True" PromptAreaCollapsed="True">
        <localreport reportpath="Report1.rdlc">
            <datasources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
            </datasources>
        </localreport>
    </rsweb:ReportViewer>
  </div>
</div>
    </div>

 

   
    
    
    <div style="height: 1010px">
               
                   
             
                    
             
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString2 %>" SelectCommand="spRVListofEmp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="spRVEmpList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="Webusitu.DataSet2TableAdapters.spRVEmpListTableAdapter"></asp:ObjectDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
       <!-- Department:--->
        <asp:DropDownList CssClass="form-control" ID="DepartmentDD" AutoPostBack="true" runat="server" DataSourceID="ReportDrop" DataTextField="Name" DataValueField="Name" OnSelectedIndexChanged="DepartmentDD_SelectedIndexChanged" Visible="False">
        </asp:DropDownList>
        <asp:SqlDataSource ID="ReportDrop" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <asp:TextBox ID="DepID" runat="server" Visible="False"></asp:TextBox>
        <br />
    
        <div style="height: 147px">
            <div style="float:left width: 285px; height: 129px ">
                <asp:GridView ID="GridView1" runat="server" DataSourceID="EmployeeTable" AutoGenerateColumns="False" DataKeyNames="Id" Width="376px" HorizontalAlign="Left" AllowSorting="True" CssClass="table table-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"  />
                        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HeaderStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="thead-dark" HorizontalAlign="Center"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
                        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
                        <asp:BoundField DataField="daysRemain" HeaderText="daysRemain" SortExpression="daysRemain" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="EmployeeTable" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [employee] WHERE ([DepartmentID] = @DepartmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DepID" DefaultValue="101" Name="DepartmentID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="RecId" DataSourceID="Leaves" Width="418px" HorizontalAlign="Right"  AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-responsive" ForeColor="Black" GridLines="Horizontal" Visible="False">
                    
                    <Columns>
                        <asp:BoundField DataField="RecId" HeaderText="RecId" InsertVisible="True" ReadOnly="True" SortExpression="RecId" Visible="false" />
                        <asp:BoundField DataField="empId" HeaderText="empId" SortExpression="empId" />
                        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" InsertVisible="false" Visible="false"/>
                        <asp:BoundField DataField="lastDays" HeaderText="Days Taken" SortExpression="lastDays" />
                        <asp:BoundField DataField="startDay" HeaderText="startDay" SortExpression="startDay" />
                        <asp:BoundField DataField="endDay" HeaderText="endDay" SortExpression="endDay" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                    <HeaderStyle CssClass="thead-dark" HorizontalAlign="Center"></HeaderStyle>
                </asp:GridView>
                
                <asp:SqlDataSource ID="Leaves" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [RecId],[empId],[DepartmentID],[lastDays] ,convert(varChar,[startDay],106) AS [startDay] ,convert(varChar,[endDay],106) AS [endDay] from [leaves] WHERE ([DepartmentID] = @DepartmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DepID" DefaultValue="101" Name="DepartmentID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div>
            
        </div>
        <br />
        <div style="width: 285px; height: 129px ">
            
            
        </div>
    </div>
</asp:Content>
