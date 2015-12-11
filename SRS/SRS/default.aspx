<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SRS._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" CreateUserText="Sign Up" CreateUserUrl="~/signup.aspx" DisplayRememberMe="False" EnableTheming="False" TitleText=""></asp:Login>
</asp:Content>
