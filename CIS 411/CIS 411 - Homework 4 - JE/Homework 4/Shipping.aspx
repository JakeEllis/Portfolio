<%@ Page Title="Shipping" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Shipping.aspx.cs" Inherits="Homework_4_Shipping" %>

<script runat="server">

</script>


<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
           <h1>Shipping</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <p>
        <label>Card Number*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CardNumber" ErrorMessage="Card Number is invalid!" ForeColor="Red" ValidationExpression="^\d{4}-\d{4}-\d{4}-\d{4}$"></asp:RegularExpressionValidator>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CardNumber" ErrorMessage="Card Number cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="CardNumber" runat="server">####-####-####-####</asp:TextBox>
    </p>

     <p>
         <label>Shipping Type*: </label>
        <asp:DropdownList ID="ShippingType" runat="server">
            <asp:listItem>FedEx</asp:listItem>
            <asp:listItem>UPS</asp:listItem>
            <asp:listItem>USPS</asp:listItem>           
        </asp:DropdownList>
  
         <label>Ship to Billing Address: </label>
         <asp:DropdownList ID="ShipToBilling" runat="server">
             <asp:ListItem>NO</asp:ListItem>
             <asp:ListItem>YES</asp:ListItem>
         </asp:DropdownList>
    </p>

    <p>
        <asp:Button ID="Submit" runat="server" Text="Submit" onclick="Shipping_Submit_Click" OnClientClick="/Homework 4/ShippingAddress.aspx"  />
    </p>


</asp:Content>
