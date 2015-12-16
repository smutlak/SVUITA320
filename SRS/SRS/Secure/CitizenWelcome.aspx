<%@ Page Title="" Language="C#" MasterPageFile="~/Master-After-Sign.master" AutoEventWireup="true" CodeBehind="CitizenWelcome.aspx.cs" Inherits="SRS.CitizenWelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="label"></asp:Label>

    Name: 
      <asp:TextBox id="Text1" 
           Text="Enter a value" 
           runat="server"/>

      <asp:RequiredFieldValidator id="RequiredFieldValidator1"  
           ControlToValidate="Text1"
           Text="Required Field!" 
           runat="server"/>

     
        
      <asp:Button id="Button1" 
           runat="server" 
           Text="Validate"/>

</asp:Content>
