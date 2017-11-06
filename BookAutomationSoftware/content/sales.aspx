<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="sales.aspx.cs" Inherits="BookAutomationSoftware.SalesPage" %>
<asp:Content ContentPlaceHolderID="masterContent" runat="server">
    <form runat="server">
        <asp:Label Text="ISBN" runat="server"/>
        <asp:TextBox ID="txtISBN" runat="server" OnTextChanged="txtISBN_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Label Text="Quantity" runat="server" />
        <asp:TextBox ID="txtQuant" Text="1" runat="server" OnTextChanged="txtQuant_TextChanged" AutoPostBack="true"/>
        <asp:Label ID="lblTotal" Text="Total: 100.00" runat="server"/>
        <div>
            <asp:Button Text="Purchase" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblAvailable" ForeColor="DarkRed" runat="server" Text="Unavailable" />
        </div>
    </form>
</asp:Content>
