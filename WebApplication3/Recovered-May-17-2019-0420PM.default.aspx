


<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication3._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="StyleSheet.css"/>
    <p id="4632em ">
        &nbsp;Select Suppresions Needed</p>
    <asp:DropDownList cssclass="test"  ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="UWPC_TEST" DataTextField="Category" DataValueField="sid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="UWPC_TEST" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString %>" SelectCommand="SELECT * FROM [SupressionCategories] ORDER BY [sid]"></asp:SqlDataSource>
    <br />
    <asp:CheckBoxList ID="CheckBoxListTest" runat="server" DataSourceID="SubCategoryListBox" DataTextField="SubCategory" DataValueField="ssid" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
    </asp:CheckBoxList>
    <asp:SqlDataSource ID="SubCategoryListBox" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString %>" SelectCommand="SELECT [ssid], [SubCategory] FROM [SupressionSubCategories] WHERE ([sid] = @sid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="sid" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="CustomerGrid" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="frid" HeaderText="frid" SortExpression="frid" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="CustomerGrid" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString %>" SelectCommand="SELECT DISTINCT [frid], [title], [fname], [lname] FROM [Sheet1$] ORDER BY [lname], [fname]"></asp:SqlDataSource>
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate List" />
    <br />
<br />
</asp:Content>



