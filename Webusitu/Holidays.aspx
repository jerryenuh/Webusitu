<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Holidays.aspx.cs" Inherits="Webusitu.Holidays" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
    <br />
    <br />
    <asp:Label ID="holidaylbl" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Enter Holiday Below"></asp:Label>
    <br />
    <div style="height: 201px; margin-left: 10px; margin-top: 10px; margin-bottom: 10px">
        <asp:GridView ID="gvHoliday" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvHoliday_RowCommand" OnRowEditing="gvHoliday_RowEditing" OnRowDeleting="gvHoliday_RowDeleting" OnRowCancelingEdit="gvHoliday_RowCancelingEdit" OnRowUpdating="gvHoliday_RowUpdating" showHeaderWhenEmpty="true" ShowFooter="true" DataKeyNames="days" AutoGenerateColumns ="false" Height="125px" Width="252px" OnSelectedIndexChanged="gvHoliday_SelectedIndexChanged">
            <%-- Theme Properties --%>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

            <Columns>
                <asp:TemplateField HeaderText ="days">
                    <ItemTemplate>
                        <asp:Label Text ='<%#Eval("days") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdays" Text ='<%#Eval("days") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="holidaytxt2" runat="server" />
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="holidaytxt2" PopupButtonID="calendarimg" DefaultView="Days" Format="dd/MM/yyyy" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Content/Edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Content/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Content/Edit.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/Content/delete.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ImageUrl="~/Content/Save.png" runat="server" CommandName="Add New" ToolTip="Add New" Width="20px" Height="20px" />
                    </FooterTemplate>

                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblSuccessMessage" Text="" runat="server" foreColor="Green" />
        <br />
        <asp:Label ID="lblErrorMessage" Text="" runat="server" foreColor="Red" />

    </div>
    <br />
    <br />
    <asp:TextBox ID="holidaytxt" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
    
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="holidaytxt2" PopupButtonID="calendarimg" DefaultView="Days" Format="dd/MM/yyyy" />

    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    <asp:Label ID="errorlbl" runat="server"></asp:Label>
    <div>
    </div>
    <br />
    <br />
    <br />
    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" OnClientCancel="CancelClick" ConfirmText="Are You Sure?" TargetControlID="Button1" />
    </asp:Content>
