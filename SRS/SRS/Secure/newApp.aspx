<%@ Page Title="" Language="C#" MasterPageFile="~/Master-After-Sign.master" AutoEventWireup="true" CodeBehind="newApp.aspx.cs" Inherits="SRS.Secure.newApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>New Application</h1>
    <asp:Table Width="80%" runat="server">
        <asp:TableRow>
            <asp:TableCell><label>Date</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <label>State type</label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlStateType" runat="server"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddlStateType" InitialValue="Please select" ErrorMessage="Please select type" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label>State No.</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStateNo" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfv2" runat="server"
                    ControlToValidate="txtStateNo"
                    Text="State No. is required." />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label>State Address</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfv3" runat="server"
                    ControlToValidate="txtAddress"
                    Text="Address is required." />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnOK" runat="server" Text="Submit"
                    CssClass="commandButton" OnClick="btnOK_Click"
                    OnClientClick="if (!Page_ClientValidate()) return false; if (!confirm('Submit Application?')) return false;" />

            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>

        

    </asp:Table>
</asp:Content>
