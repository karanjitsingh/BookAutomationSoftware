<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="stats.aspx.cs" Inherits="BookAutomationSoftware.StatsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="masterContent" runat="server">
    <form runat="server">
        <div class="stats-content">
            <asp:SqlDataSource ID="sqlRevenue" SelectCommand="select inventory.name as Book, inventory.author as Author, inventory.publisher as Publisher, inventory.isbn as ISBN, sum(sales.quantity) as [Copies sold], sum(sales.total_amount) as Revenue from inventory join sales on inventory.id = sales.book_id where sales.date >= @from and sales.date <=dateadd(day,1,@to) group by name, author, publisher, isbn order by Revenue desc ;" runat="server" ConnectionString='<%$ ConnectionStrings:dbcon %>'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="calFrom" Name="from" PropertyName="SelectedDate"/>
                    <asp:ControlParameter ControlID="calTo" Name="to" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Label CssClass="content-header" Text="Sales overview " runat="server"></asp:Label>
            <div style="display:flex; justify-content:space-around; margin-bottom: 10px;">
                <div>
                    <asp:Label Text="From: " runat="server"></asp:Label>
                    <asp:Calendar ID="calFrom" runat="server" OnSelectionChanged="calFrom_SelectionChanged" SelectedDate='<%# DateTime.Today %>'></asp:Calendar>
                </div>
                <div>
                    <asp:Label Text="To: " runat="server"></asp:Label>
                    <asp:Calendar ID="calTo" runat="server"  OnSelectionChanged="calFrom_SelectionChanged" SelectedDate='<%# DateTime.Today %>'></asp:Calendar>
                </div>
            </div>
            <asp:GridView CssClass="dataview" EmptyDataText="" ID="revenueStats" AutoGenerateColumns="true" runat="server" DataSourceID="sqlRevenue" AllowPaging="true" PageSize="5"></asp:GridView>

            <asp:Label Text="Inventory shortage" CssClass="content-header" style="margin-top:20px; margin-bottom: 10px" runat="server"></asp:Label>
            <div style="margin-bottom:10px;">
                <asp:Label Text="Minimum Inventory Level" runat="server" />
                <asp:TextBox AutoPostBack="true" ID="txtThreshold" Text="1" runat="server" OnTextChanged="txtThreshold_TextChanged" />
                <asp:Label Text="Delivery time" runat="server" />
                <asp:TextBox AutoPostBack="true" ID="txtDelay" Text="1" runat="server" />
            </div>

            <asp:SqlDataSource ID="sqlInventoryLevel" SelectCommand="declare @to as date = dateadd(day,1,getdate());declare @from as date = dateadd(week,-1,getdate());select inventory.name as Book, inventory.author as Author, inventory.publisher as Publisher, inventory.isbn as ISBN, sum(sales.quantity) as [Copies Sold], sum(sales.quantity)*@delay as [Inventory Level] , sum(sales.total_amount) as Revenue from inventory join sales on inventory.id = sales.book_id where sales.date >= @from and sales.date <= @to group by name, author, publisher, isbn having sum(sales.quantity)*@delay <= @threshold order by Revenue desc;" runat="server" ConnectionString='<%$ ConnectionStrings:dbcon %>'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtDelay" Name="delay" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtThreshold" Name="threshold" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            

            <asp:GridView CssClass="dataview" EmptyDataText="No results" ID="gridview2" AutoGenerateColumns="true" runat="server" DataSourceID="sqlInventoryLevel" AllowPaging="true" PageSize="5"></asp:GridView>
        </div>
    </form>
</asp:Content>
