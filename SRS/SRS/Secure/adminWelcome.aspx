<%@ Page Title="" Language="C#" MasterPageFile="~/Master-For-Admin.master" AutoEventWireup="true" CodeBehind="adminWelcome.aspx.cs" Inherits="SRS.adminWelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!--<asp:Label ID="Label1" runat="server" Text="label"></asp:Label>-->
    <div>
        <asp:SqlDataSource ID="appDataSource" Runat="server" 
          SelectCommand ="SELECT [appl_id], [appl_sysuser_id], [appl_date], [appl_estate_type_id], [appl_estate_no], [appl_estate_address], [appl_assign_sysuser_id], [appl_assign_date] FROM [user_application]"
            ConnectionString= "<%$ ConnectionStrings:SRSDB %>" 
                DataSourceMode="DataReader">
        </asp:SqlDataSource>
        <asp:GridView ID="appGridView" Runat="server" 
             DataSourceID="appDataSource" Width="100%"
            DataKeyNames="appl_id" AutoGenerateColumns="False"
            BorderWidth="1px" BackColor="White" 
             CellPadding="3" CellSpacing="2" BorderStyle="Solid" 
             BorderColor="Black">
            <FooterStyle ForeColor="#8C4510" 
              BackColor="#F7DFB5"></FooterStyle>
            <PagerStyle ForeColor="#8C4510" 
              HorizontalAlign="Center"></PagerStyle>
            <HeaderStyle Font-Bold="True" CssClass="sbihead"
              ></HeaderStyle>

            <Columns>
                <asp:BoundField ReadOnly="True" 
                  HeaderText="ID" InsertVisible="False" 
                  DataField="appl_id"
                    SortExpression="appl_id"></asp:BoundField>

               <asp:BoundField HeaderText="Citizan Name" 
                  DataField="sysuser_name" 
                  SortExpression="sysuser_name"></asp:BoundField>

                <asp:BoundField HeaderText="Date" 
                  DataField="appl_date" 
                  SortExpression="appl_date"></asp:BoundField>

                <asp:BoundField HeaderText="StateType" 
                  DataField="estate_type_name" 
                  SortExpression="estate_type_name"></asp:BoundField>

                <asp:BoundField HeaderText="State No" 
                  DataField="appl_estate_no" 
                  SortExpression="appl_estate_no"></asp:BoundField>

                <asp:BoundField HeaderText="State Address" 
                  DataField="appl_estate_address" 
                  SortExpression="appl_estate_address"></asp:BoundField>

                <asp:BoundField HeaderText="assignee" 
                  DataField="appl_assign_sysuser_id" 
                  SortExpression="appl_assign_sysuser_id"></asp:BoundField>

                <asp:BoundField HeaderText="assign date" 
                  DataField="appl_assign_date" 
                  SortExpression="appl_assign_date"></asp:BoundField>

                
            </Columns>
        </asp:GridView>
    
    </div>
</asp:Content>
