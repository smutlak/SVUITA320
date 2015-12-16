<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="SRS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
    </div>
    </form>
</body>
</html>
