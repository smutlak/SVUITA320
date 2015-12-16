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
        <asp:DropDownList ID="ddStateType" runat="server"></asp:DropDownList>
    </p>
    <p>
        <label>State No.</label>
        <asp:TextBox ID="txtStateNo" runat="server"></asp:TextBox>
    </p>
    <p>
        <label>State Address</label>
        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnOK" runat="server" Text="OK"  
            CssClass="commandButton" /></p>
</div>


    

</asp:Content>
