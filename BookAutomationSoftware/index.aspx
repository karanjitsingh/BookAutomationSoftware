<%@ Page Title="Welcome to BAS" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BookAutomationSoftware.IndexPage" %>
<asp:Content ContentPlaceHolderID="masterContent" runat="server">
    <div class="page-content">
        <form runat="server">
            <div id="simpleSearch" runat="server">
                <asp:Label Text="Search for a book" runat="server"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="Search" />
                <div id="resultDiv" runat="server" visible="false">
                    <asp:Label ID="lblBookName" runat="server"></asp:Label> 
                    <asp:Label ID="lblAuthor" runat="server"></asp:Label> 
                    <asp:Label ID="lblPublisher" runat="server"></asp:Label> 
                    <asp:Label ID="lblPrice" runat="server"></asp:Label> 
                    <asp:Image ID="imgBookImage" runat="server" />
                    <asp:Label ID="lblStock" runat="server"></asp:Label>
                </div>
                <div id="noResultsDiv" visible="false" runat="server">
                    No Results
                </div>
                <div id="requestDiv" runat="server" visible="false">
                    <asp:Label runat="server" Text="Can't find your book? Request for your specific book "></asp:Label>
                    <asp:HyperLink runat="server" Text="here." NavigateUrl="/index.aspx?request"></asp:HyperLink>
                </div>
            </div>
            <div id="requestForm" runat="server">
                <asp:Label Text="Enter information for book:" runat="server"></asp:Label>
                <asp:Label Text="ISBN *" runat="server"></asp:Label>
                <asp:TextBox ID="txtRequestISBN" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{13}$" runat="server" ControlToValidate="txtRequestISBN"></asp:RegularExpressionValidator>

                <asp:Label Text="Book *" runat="server"></asp:Label>
                <asp:TextBox ID="txtRequestBook" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRequestBook"></asp:RequiredFieldValidator>

                <asp:Label Text="Author *" runat="server"></asp:Label>
                <asp:TextBox ID="txtRequestAuthor" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRequestBook"></asp:RequiredFieldValidator>

                <asp:Label Text="Publisher *" runat="server"></asp:Label>
                <asp:TextBox ID="txtRequestPublisher" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRequestBook"></asp:RequiredFieldValidator>

                <asp:Label Text="We'll send you a notification over email (optional)" runat="server"></asp:Label>
                <asp:TextBox ID="txtRequestEmail" runat="server"></asp:TextBox>

                <asp:Button ID="btnRequest" Text="Request" OnClick="btnRequest_Click" runat="server"/>

            </div>
            <div id="requestComeplete" runat="server">
                <asp:Label Text="Request successful!" runat="server"></asp:Label>
                <asp:HyperLink Text="&larr; Go back to search" runat="server" NavigateUrl="/index.aspx"></asp:HyperLink>
                <asp:HyperLink Text="Request another" runat="server" NavigateUrl="/index.aspx?request"></asp:HyperLink>
            </div>
        </form>
    </div>
</asp:Content>
