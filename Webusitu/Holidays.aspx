<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Holidays.aspx.cs" Inherits="Webusitu.Holidays" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:Image ID="Image1" runat="server" Height="117px" ImageUrl="~/Content/HEART-NSTA-Trust-Logo.png" Width="111px" />
    <br />
    <br />
    <asp:Label ID="holidaylbl" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Enter Holiday Below"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="holidaytxt" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
    
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="holidaytxt"
                PopupButtonID="calendarimg" DefaultView="Days" Format="dd/MM/yyyy" />

    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    <br />
    <br />
    <br />
    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" OnClientCancel="CancelClick" ConfirmText="Are You Sure?" TargetControlID="Button1" />
    <asp:Label ID="errorlbl" runat="server"></asp:Label>
</asp:Content>
