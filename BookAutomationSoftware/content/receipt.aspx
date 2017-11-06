<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="BookAutomationSoftware.content.ReceiptPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipt</title>
</head>
<body>
    <div id="receipt" runat="server" visible="false">
        <asp:Label Text="BAS Receipt" runat="server" Font-Size="Medium"></asp:Label>
        <br />
        <asp:Label ID="lblItem" Text="Item: " runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblQuantity" Text="Quanitity: " runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblTotal" Text="Total: " runat="server"></asp:Label>
    </div>
</body>
</html>
