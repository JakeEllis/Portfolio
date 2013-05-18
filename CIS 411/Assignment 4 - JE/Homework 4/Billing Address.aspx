<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Billing Address.aspx.vb" Inherits="Billing_Address" %>

<!DOCTYPE Html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billing Address</title>
    <style type="text/css">
        #form1 {
            height: 299px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    ENTER YOUR BILLING ADDRESS
    </div>
        <asp:TextBox ID="First" runat="server"></asp:TextBox>
        <asp:TextBox ID="Last" runat="server"></asp:TextBox>
        <asp:TextBox ID="Address" runat="server"></asp:TextBox>
        <asp:TextBox ID="City" runat="server"></asp:TextBox>
        <asp:DropDownList ID="State" runat="server"></asp:DropDownList>
    </form>
</body>
</html>
