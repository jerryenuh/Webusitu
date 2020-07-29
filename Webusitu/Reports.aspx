<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Webusitu.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 200px">
        <br />
        <asp:Label ID="Label1" runat="server" Text="Report View"></asp:Label>
        <br />
        Department:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ReportDrop" DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
        <asp:SqlDataSource ID="ReportDrop" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Records" BackColor="#DEBA84" border ="1px"  BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="1" >
            <Columns>
                <asp:BoundField DataField="empId" HeaderText="empId" SortExpression="empId">
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName">
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName">
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="startDay" HeaderText="startDay" SortExpression="startDay">
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="endDay" HeaderText="endDay" SortExpression="endDay">
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="daysRemain" HeaderText="daysRemain" SortExpression="daysRemain" >
                <HeaderStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle CssClass="padd" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="Records" runat="server" ConnectionString="<%$ ConnectionStrings:LeaveApplicationSystemConnectionString %>" SelectCommand="SELECT leaves.empId, employee.FName, employee.LName, Department.Name, leaves.startDay, leaves.endDay, employee.daysRemain FROM Department CROSS JOIN employee CROSS JOIN leaves WHERE (employee.DepartmentID = Department.Id) AND (employee.Id = leaves.empId)"></asp:SqlDataSource>
    </div>
</asp:Content>
