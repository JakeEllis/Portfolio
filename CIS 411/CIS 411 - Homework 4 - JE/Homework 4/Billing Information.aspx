<%@ Page Title="Billing Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="~/Homework 4/Billing Information.aspx.cs" Inherits="Homework_4_Billing_Information" %>

<script runat="server">


</script>


<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
           <h1>Billing Information</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <p>
        <label>Card Number*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="BillInfo_CardNumber" ErrorMessage="Card Number is in an invalid format!" ForeColor="Red" ValidationExpression="^\d{4}-\d{4}-\d{4}-\d{4}$"></asp:RegularExpressionValidator>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BillInfo_CardNumber" ErrorMessage="Card Number cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="BillInfo_CardNumber" runat="server">####-####-####-####</asp:TextBox>
    </p>

     <p>
         <label>Expiration Date*:&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;<asp:DropdownList ID="Month" runat="server">
            <asp:listItem>01</asp:listItem>
            <asp:listItem>02</asp:listItem>
            <asp:listItem>03</asp:listItem>
            <asp:listItem>04</asp:listItem>
            <asp:listItem>05</asp:listItem>
            <asp:listItem>06</asp:listItem>
            <asp:listItem>07</asp:listItem>
            <asp:listItem>08</asp:listItem>
            <asp:listItem>09</asp:listItem>
            <asp:listItem>10</asp:listItem>
            <asp:listItem>11</asp:listItem>
            <asp:listItem>12</asp:listItem>
        </asp:DropdownList>
  
         <asp:DropdownList ID="Year" runat="server">
             <asp:ListItem>2013</asp:ListItem>
             <asp:ListItem>2014</asp:ListItem>
             <asp:ListItem>2015</asp:ListItem>
             <asp:ListItem>2016</asp:ListItem>
             <asp:ListItem>2017</asp:ListItem>
         </asp:DropdownList>
    </p>

    <p>
       <label>CSV Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="BillInfo_CSVCode" ErrorMessage="CSV cannot contain letters!" ForeColor="Red" ValidationExpression="^\d{3,4}$"></asp:RegularExpressionValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BillInfo_CSVCode" ErrorMessage="CSV Code cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label> 
        <asp:TextBox ID="BillInfo_CSVCode" runat="server" ForeColor="Black" >###</asp:TextBox>
    </p>

    <p>
        <asp:Button ID="Submit" runat="server" Text="Submit" onclick="Submit_Click" OnClientClick="../Homework 4/Shipping.aspx"/>
    </p>


</asp:Content>
