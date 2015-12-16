<%@ Page Title="" Language="C#" MasterPageFile="~/Master-After-Sign.master" AutoEventWireup="true" CodeBehind="newApp.aspx.cs" Inherits="SRS.Secure.newApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     
    
<div class="workArea">
    <p>
        <label>Date</label>
        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    </p>
    <p>
        <label>State type</label>
        <asp:DropDownList ID="ddlStateType" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddlStateType" InitialValue="Please select" ErrorMessage="Please select type" />
    </p>
    <p>
        <label>State No.</label>
        <asp:TextBox ID="txtStateNo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv2" runat="server"  
            ControlToValidate="txtStateNo" 
            Text="State No. is required." />
    </p>
    <p>
        <label>State Address</label>
        <asp:TextBox ID="txtAddress" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtAddress" InitialValue="Please select" ErrorMessage="Please enter address"  />
    </p>
    <p>
        <asp:Button ID="btnOK" runat="server" Text="Submit" ValidationGroup="SaveApplication" CausesValidation="true" 
            CssClass="commandButton" OnClick="btnOK_Click" /></p>

    
</div>

</asp:Content>
