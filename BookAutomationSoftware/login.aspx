<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BookAutomationSoftware.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BAS Login</title>
</head>
<body style="background:#f1f1f1">
    <div class="login-background"></div>
    <form runat="server">
        
        <div class="login-form">
            <div class="logo"></div>
            <asp:Label Text="Username" runat="server"></asp:Label>
            <asp:TextBox CssClass="login-form-textbox" ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="login-form-required" ControlToValidate="txtUsername" runat="server"></asp:RequiredFieldValidator>
            <asp:Label Text="Password" runat="server"></asp:Label>
            <asp:TextBox CssClass="login-form-textbox" ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="login-form-required" ControlToValidate="txtPassword" SkinID="RequiredField"  runat="server"></asp:RequiredFieldValidator>            
            <asp:Button CssClass="login-form-submit" ID="btnSubmit" runat="server" Text="Log In" OnClick="btnSubmit_Click"/>
            <div>
                <asp:HyperLink NavigateUrl="/index.aspx" runat="server">&larr;	Back to BAS home</asp:HyperLink>
                <asp:Label CssClass="invalid-login" ID="lblInvalidLogin" runat="server" Visible="false">Invalid Login</asp:Label>
            </div>
        </div>
    </form>
    <div class="login-footer">Book Automation Software</div>
</body>
</html>
