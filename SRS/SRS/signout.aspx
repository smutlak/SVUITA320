<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="signout.aspx.cs" Inherits="SRS.signout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="label"></asp:Label><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">SIGN IN again.</asp:HyperLink>
</asp:Content>
