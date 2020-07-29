<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Webusitu.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 625px">
        <br />
    <h2>Report Views</h2>
        <br />
        Department:
        <asp:DropDownList ID="DepartmentDD" AutoPostBack="true" runat="server" DataSourceID="ReportDrop" DataTextField="Name" DataValueField="Name" OnSelectedIndexChanged="DepartmentDD_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="ReportDrop" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <asp:TextBox ID="DepID" runat="server" Visible="False"></asp:TextBox>
        <br />
    
        <div style="height: 147px">
            <div style="float:left width: 285px; height: 129px ">
                <h4 style="width: 159px">List of Employees</h4>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="EmployeeTable" AutoGenerateColumns="False" DataKeyNames="Id" Width="376px" HorizontalAlign="Left" AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"  />
                        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HeaderStyle-HorizontalAlign="Center"/>
                        <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
                        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
                        <asp:BoundField DataField="daysRemain" HeaderText="daysRemain" SortExpression="daysRemain" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="EmployeeTable" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [employee] WHERE ([DepartmentID] = @DepartmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DepID" DefaultValue="101" Name="DepartmentID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="RecId" DataSourceID="Leaves" Width="418px" HorizontalAlign="Right"  AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    
                    <Columns>
                        <asp:BoundField DataField="RecId" HeaderText="RecId" InsertVisible="False" ReadOnly="True" SortExpression="RecId" />
                        <asp:BoundField DataField="empId" HeaderText="empId" SortExpression="empId" />
                        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
                        <asp:BoundField DataField="lastDays" HeaderText="lastDays" SortExpression="lastDays" />
                        <asp:BoundField DataField="startDay" HeaderText="startDay" SortExpression="startDay" />
                        <asp:BoundField DataField="endDay" HeaderText="endDay" SortExpression="endDay" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                
                <asp:SqlDataSource ID="Leaves" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT * FROM [leaves] WHERE ([DepartmentID] = @DepartmentID)">
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
