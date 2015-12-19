<%@ Page Title="" Language="C#" MasterPageFile="~/Master-For-Admin.master" AutoEventWireup="true" CodeBehind="adminWelcome.aspx.cs" Inherits="SRS.adminWelcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!--<asp:Label ID="Label1" runat="server" Text="label"></asp:Label>-->
    <!--<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.4.js"></script>-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/ui-lightness/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <!--<script type="text/javascript">
        $(document).ready(function () {
            $("#btnSubmit").click(function () {
                alert("Alert using jQuery");
            });
        });
    </script>
    <input type="button" value="Test" id="btnSubmit" />-->

    <script type="text/javascript">
        $(document).on("click", "[id*=lnkView]", function () {
            $("#ApplicationID").html($(".Id", $(this).closest("tr")).html());
            $("#name").html($(".Name", $(this).closest("tr")).html());

            $("#dialog").dialog({
                title: "Assign to volunteer",
                buttons: {
                    Ok: function () {
                        doAssign();
                        //$(this).dialog('close');
                    },
                    Cancel: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
            return false;
        });

        function doAssign() {
            
            window.location = '/Secure/adminWelcome.aspx?appID=' + $("#ApplicationID").text() + '&vID=' + 5;
           // window.load("adminWelcome.aspx",
            //                         { appID: 2 });
        }

    </script>

    <div>
        <asp:SqlDataSource ID="appDataSource" runat="server"
            SelectCommand="SELECT [appl_id], [appl_sysuser_id], [appl_date], [appl_estate_type_id], [appl_estate_no], [appl_estate_address], [appl_assign_sysuser_id], [appl_assign_date] FROM [user_application]"
            ConnectionString="<%$ ConnectionStrings:SRSDB %>"
            DataSourceMode="DataReader"></asp:SqlDataSource>
        <asp:GridView ID="appGridView" runat="server" OnRowCommand="appGridView_RowCommand1"
            DataSourceID="appDataSource" Width="100%"
            DataKeyNames="appl_id" AutoGenerateColumns="False"
            BorderWidth="1px" BackColor="White"
            CellPadding="3" CellSpacing="2" BorderStyle="Solid"
            BorderColor="Black">
            <FooterStyle ForeColor="#8C4510"
                BackColor="#F7DFB5"></FooterStyle>
            <PagerStyle ForeColor="#8C4510"
                HorizontalAlign="Center"></PagerStyle>
            <HeaderStyle Font-Bold="True" CssClass="sbihead"></HeaderStyle>

            <Columns>
                <asp:BoundField ReadOnly="True"
                    HeaderText="ID" InsertVisible="False"
                    DataField="appl_id"
                    ItemStyle-CssClass="Id"
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

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="lnkView" runat="server" Text="Assign"
                            ControlStyle-Width="75" ControlStyle-BackColor="#ffcc00"
                            ControlStyle-Font-Bold="true" />

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
    <div id="dialog" style="display: none">
        <b>Application ID:</b> <label id="ApplicationID"></label>
        <br />
        <b>Name:</b><asp:DropDownList ID="ddlvolunteer" runat="server"></asp:DropDownList>

    </div>
</asp:Content>
