<%@ Page Title="Shipping Address" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ShippingAddress.aspx.cs" Inherits="Homework_4_ShippingAddress" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
           <h1>Shipping Address</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>
        <label>First Name*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Ship_FirstName" ErrorMessage="Invalid First Name" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Ship_FirstName" ErrorMessage="First Name cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="Ship_FirstName" runat="server"></asp:TextBox>
    </p>

     <p>
         <label>Last Name*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Ship_LastName" ErrorMessage="Invalid Last Name" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Ship_LastName" ErrorMessage="Last Name cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
         </label>
        &nbsp;<asp:TextBox ID="Ship_LastName" runat="server"></asp:TextBox>
    </p>

    <p>
       <label>Address*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Ship_Address" ErrorMessage="Address cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="Ship_Address" runat="server" ></asp:TextBox>
    </p>

    <p>
        <label>City*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Ship_City" ErrorMessage="Invalid City Name" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Ship_City" ErrorMessage="City cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="Ship_City" runat="server"></asp:TextBox>
    </p>

    <p>
        <label>State*: </label>
        <asp:dropDownList ID="Ship_State" runat="server">
            <asp:ListItem>AL</asp:ListItem>
            <asp:ListItem>CA</asp:ListItem>
            <asp:ListItem>FL</asp:ListItem>
            <asp:ListItem>IL</asp:ListItem>
            <asp:ListItem>KY</asp:ListItem>
            <asp:ListItem>MA</asp:ListItem>
            <asp:ListItem>NH</asp:ListItem>
            <asp:ListItem>NC</asp:ListItem>
            <asp:ListItem>OR</asp:ListItem>
            <asp:ListItem>SD</asp:ListItem>
        </asp:dropDownList>
    </p>

    <p>
        <label>Zip Code*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Ship_ZipCode" ErrorMessage="Zip Code cannot contain letters!" ForeColor="Red" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Ship_ZipCode" ErrorMessage="Zip Code cannot be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="Ship_ZipCode" runat="server" >#####</asp:TextBox>
    </p>

    <p>
        <asp:Button ID="Next" runat="server" Text="Next" OnClientClick="/Homework 4/Summary.aspx" OnClick="Next_Click"  />
    </p>

</asp:Content>





