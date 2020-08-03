<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Webusitu.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 625px">
        <br />
    <h2>Report Views</h2>
        <br />
        Department:
        <asp:DropDownList CssClass="form-control" ID="DepartmentDD" AutoPostBack="true" runat="server" DataSourceID="ReportDrop" DataTextField="Name" DataValueField="Name" OnSelectedIndexChanged="DepartmentDD_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="ReportDrop" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <asp:TextBox ID="DepID" runat="server" Visible="False"></asp:TextBox>
        <br />
    
        <div style="height: 147px">
            <div style="float:left width: 285px; height: 129px ">
                <h4 style="width: 159px">List of Employees</h4>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="EmployeeTable" AutoGenerateColumns="False" DataKeyNames="Id" Width="376px" HorizontalAlign="Left" AllowSorting="True" CssClass="table table-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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

                
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="RecId" DataSourceID="Leaves" Width="418px" HorizontalAlign="Right"  AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-responsive" ForeColor="Black" GridLines="Horizontal">
                    
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
