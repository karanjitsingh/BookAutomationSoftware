<%@ Page Title="Welcome to BAS" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BookAutomationSoftware.IndexPage" %>
<asp:Content ContentPlaceHolderID="masterContent" runat="server">
    <div class="home-content">
        <form runat="server">
            <div id="simpleSearch" runat="server">

                <div class="search-box">
                    <asp:TextBox placeholder="BAS Search" ID="txtSearch" runat="server"> </asp:TextBox>
                    <asp:Button CssClass="search-button" ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text=" "/>
                </div>
                <div class="result-div" id="resultDiv" runat="server" visible="false">
                    <div>
                        <asp:Label CssClass="content-header" runat="server">Top result</asp:Label>
                        <asp:Label ID="lblBookName" runat="server"></asp:Label>
                        <asp:Label ID="lblISBN" runat="server"></asp:Label> 
                        <asp:Label ID="lblAuthor" runat="server"></asp:Label> 
                        <asp:Label ID="lblPublisher" runat="server"></asp:Label> 
                        <asp:Label ID="lblPrice" runat="server"></asp:Label> 
                        <asp:Label ID="lblStock" runat="server"></asp:Label>
                    </div>
                    <asp:Image ID="imgBookImage" runat="server" />
                </div>
                <div class="result-div" id="noResultsDiv" visible="false" runat="server">
                    <asp:Label CssClass="content-header" runat="server">No results</asp:Label>
                </div>
                <div class="result-div-footer" id="requestDiv" runat="server" visible="false">
                    <asp:Label runat="server" Text="Can't find your book? Request for your specific book "></asp:Label>
                    <asp:HyperLink runat="server" Text="here." NavigateUrl="/index.aspx?request"></asp:HyperLink>
                </div>
            </div>
            <div class="request-form" id="requestForm" runat="server">
                <asp:Label CssClass="content-header" Text="Request a book" runat="server"></asp:Label>
                <asp:TextBox placeholder="ISBN *" ID="txtRequestISBN" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator CssClass="textbox-validator" ValidationExpression="^[0-9]{13}$" runat="server" ControlToValidate="txtRequestISBN"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtRequestISBN"></asp:RequiredFieldValidator>

                <asp:TextBox placeholder="Book name *" ID="txtRequestBook" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtRequestBook"></asp:RequiredFieldValidator>

                <asp:TextBox placeholder="Author *" ID="txtRequestAuthor" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtRequestBook"></asp:RequiredFieldValidator>

                <asp:TextBox placeholder="Publisher *" ID="txtRequestPublisher" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="textbox-validator" runat="server" ControlToValidate="txtRequestBook"></asp:RequiredFieldValidator>

                <asp:TextBox placeholder="We'll send you a notification over email (optional)" ID="txtRequestEmail" runat="server"></asp:TextBox>

                <asp:Button ID="btnRequest" Text="Request" OnClick="btnRequest_Click" runat="server"/>
                <asp:HyperLink CssClass="nav-link" Text="&larr; Go back to search" runat="server" NavigateUrl="/index.aspx"></asp:HyperLink>
            </div>
            <div class="request-submit" id="requestComeplete" runat="server">
                <div>
                    <asp:Label CssClass="content-header" Text="Request successful!" runat="server"></asp:Label>
                    <asp:HyperLink CssClass="nav-link" style="font-size:20px; margin-top:0px; margin-left:10px; font-weight: 100; color: #666;" Text="Request another?" runat="server" NavigateUrl="/index.aspx?request"></asp:HyperLink>
                </div>
                <asp:HyperLink CssClass="nav-link" Text="&larr; Go back to search" runat="server" NavigateUrl="/index.aspx"></asp:HyperLink>
                
            </div>
        </form>
    </div>
</asp:Content>
