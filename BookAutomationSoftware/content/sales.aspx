<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="sales.aspx.cs" Inherits="BookAutomationSoftware.SalesPage" %>
<asp:Content ContentPlaceHolderID="masterContent" runat="server">
    <form runat="server">
        <div class="sales-content request-form">
        <asp:Label Text="ISBN" runat="server"/>
        <asp:TextBox ID="txtISBN" runat="server" AutoPostBack="true"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="textbox-validator" ValidationExpression="^[0-9]{13}$" runat="server" ControlToValidate="txtISBN"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtISBN"></asp:RequiredFieldValidator>
        <asp:Label Text="Quantity" runat="server" />
        <asp:TextBox ID="txtQuant" Text="1" runat="server" AutoPostBack="true"/>
        <asp:RequiredFieldValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtQuant"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtQuant" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
        <asp:Label ID="lblTotal" Text="Total: 0.00" runat="server"/>
        <asp:Button Text="Purchase" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
        <asp:Label ID="lblAvailable" ForeColor="DarkRed" Visible="false" style="margin-top:10px; font-size: 13px;" runat="server" Text="Unavailable" />

        </div>
    </form>
</asp:Content>
