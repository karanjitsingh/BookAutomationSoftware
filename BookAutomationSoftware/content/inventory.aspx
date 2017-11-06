<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="BookAutomationSoftware.InventoryPage" %>
<asp:Content ContentPlaceHolderID="masterContent" runat="server">
    <form runat="server">

        <asp:GridView ID="gridview" DataSourceID="sqlDataSource" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="1" ShowFooter="true" EnableViewState="false" OnRowUpdating="gridview_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox placeholder= ID="txtInsertName" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ISBN">
                    <ItemTemplate>
                        <asp:Label ID="lblISBN" runat="server" Text='<%# Bind("isbn") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertISBN" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author">
                    <ItemTemplate>
                        <asp:Label ID="lblAuthor" runat="server" Text='<%# Bind("author") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertAuthor" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Publisher">
                    <ItemTemplate>
                        <asp:Label ID="lblPublisher" runat="server" Text='<%# Bind("publisher") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertPublisher" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stock">
                    <ItemTemplate>
                        <asp:Label ID="lblStock" runat="server" Text='<%# Bind("stock") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUpdateStock" runat="server" Text='<%# Eval("stock") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertStock" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rack">
                    <ItemTemplate>
                        <asp:Label ID="lblRack" runat="server" Text='<%# Bind("rack_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertRack" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertPrice" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate><asp:Button ID="btnInsertRow" Text="Add" runat="server" OnClick="btnInsertRow_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDataSource" ConnectionString='<%$ ConnectionStrings:dbcon %>' SelectCommand="select * from inventory" UpdateCommand="update inventory set stock=@stock, request=0 where id=@id" runat="server">
            <UpdateParameters>
                <asp:Parameter Name="stock" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
