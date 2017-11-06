<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeBehind="stats.aspx.cs" Inherits="BookAutomationSoftware.StatsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="masterContent" runat="server">
    <form runat="server">
        <asp:SqlDataSource ID="sqlRevenue" SelectCommand="select inventory.name as Book, inventory.author as Author, inventory.publisher as Publisher, inventory.isbn as ISBN, sum(sales.quantity) as [Copies sold], sum(sales.total_amount) as Revenue from inventory join sales on inventory.id = sales.book_id where sales.date >= @from and sales.date <=dateadd(day,1,@to) group by name, author, publisher, isbn order by Revenue desc ;" runat="server" ConnectionString='<%$ ConnectionStrings:dbcon %>'>
            <SelectParameters>
                <asp:ControlParameter ControlID="calFrom" Name="from" PropertyName="SelectedDate"/>
                <asp:ControlParameter ControlID="calTo" Name="to" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Label Text="Sale statistics: " runat="server"></asp:Label>
        <asp:Label Text="From: " runat="server"></asp:Label>
        <asp:Calendar ID="calFrom" runat="server" OnSelectionChanged="calFrom_SelectionChanged" SelectedDate='<%# DateTime.Today %>'></asp:Calendar>
        <asp:Label Text="To: " runat="server"></asp:Label>
        <asp:Calendar ID="calTo" runat="server"  OnSelectionChanged="calFrom_SelectionChanged" SelectedDate='<%# DateTime.Today %>'></asp:Calendar>
        <asp:GridView EmptyDataText="No results" ID="revenueStats" AutoGenerateColumns="true" runat="server" DataSourceID="sqlRevenue" AllowPaging="true" PageSize="5"></asp:GridView>

        <asp:Label Text="Minimum Inventory Level" runat="server" />
        <asp:TextBox ID="txtThreshold" Text="1" runat="server" />
        <asp:Label Text="Delivery time" runat="server" />
        <asp:TextBox ID="txtDelay" Text="1" runat="server" />

        <asp:SqlDataSource ID="sqlInventoryLevel" SelectCommand="declare @to as date = dateadd(day,1,getdate());declare @from as date = dateadd(week,-1,getdate());select inventory.name as Book, inventory.author as Author, inventory.publisher as Publisher, inventory.isbn as ISBN, sum(sales.quantity) as [Copies Sold], sum(sales.quantity)*@delay as [Inventory Level] , sum(sales.total_amount) as Revenue from inventory join sales on inventory.id = sales.book_id where sales.date >= @from and sales.date <= @to group by name, author, publisher, isbn having sum(sales.quantity)*@delay <= @threshold order by Revenue desc;" runat="server" ConnectionString='<%$ ConnectionStrings:dbcon %>'>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDelay" Name="delay" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtThreshold" Name="threshold" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Label Text="Short on inventory" runat="server"></asp:Label>

        <asp:GridView EmptyDataText="No results" ID="gridview2" AutoGenerateColumns="true" runat="server" DataSourceID="sqlInventoryLevel" AllowPaging="true" PageSize="5"></asp:GridView>
    </form>
</asp:Content>
