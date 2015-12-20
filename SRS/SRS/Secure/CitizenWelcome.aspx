<%@ Page Title="" Language="C#" MasterPageFile="~/Master-After-Sign.master" AutoEventWireup="true" CodeBehind="CitizenWelcome.aspx.cs" Inherits="SRS.CitizenWelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <h1>Applications</h1>
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
             BorderColor="Black" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found">
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
                  DataField="assignee_user_name" 
                  SortExpression="assignee_user_name"></asp:BoundField>

                <asp:BoundField HeaderText="assign date" 
                  DataField="assign_date" 
                  SortExpression="assign_date"></asp:BoundField>

                
            </Columns>
        </asp:GridView>
    
    </div>
    
</asp:Content>
