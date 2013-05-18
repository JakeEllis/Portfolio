<%@ Page Title="Billing Address" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Billing Address.aspx.cs" Inherits="Homework_4_Billing_Address" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
           <h1>Billing Address</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>
        <label>First Name*:&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="FirstName" ErrorMessage="Invalid First Name" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:RequiredFieldValidator ID="Required_FirstName" runat="server" ErrorMessage="First Name cannot be blank!" ControlToValidate="FirstName" ForeColor="Red" SetFocusOnError="True" ValidateRequestMode="Enabled" ViewStateMode="Enabled"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
    </p>

     <p>
         <label>Last Name*:&nbsp;&nbsp;&nbsp;&nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="LastName" ErrorMessage="Invalid Last Name" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="Required_LastName" runat="server" ErrorMessage="Last Name cannot be blank!!" ControlToValidate="LastName" ForeColor="Red"></asp:RequiredFieldValidator>
         </label>
        &nbsp;<asp:TextBox ID="LastName" runat="server"></asp:TextBox>
    </p>

    <p>
       <label>Address*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <asp:RequiredFieldValidator ID="Required_Address" runat="server" ErrorMessage="Address cannot be blank!!" ControlToValidate="Address" ForeColor="Red"></asp:RequiredFieldValidator>
        </label> 
        <asp:TextBox ID="Address" runat="server" ></asp:TextBox>
    </p>

    <p>
        <label>City*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="City" ErrorMessage="Invalid City Name" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="Required_City" runat="server" ErrorMessage="City cannot be blank!!" ControlToValidate="City" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="City" runat="server"></asp:TextBox>
    </p>

    <p>
        <label>State*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="Required_State" runat="server" ErrorMessage="You must select a state!" ControlToValidate="State" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:dropDownList ID="State" runat="server">
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
        <label>Zip Code*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ZipCode" ErrorMessage="Zip Code is invalid" ForeColor="Red" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:RequiredFieldValidator ID="Required_Zip" runat="server" ErrorMessage="Zip Code cannot be blank!!" ControlToValidate="Zipcode" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="ZipCode" runat="server" >#####</asp:TextBox>
    </p>

    <p>
        <asp:Button ID="Continue" runat="server" Text="Next" onclick="Continue_Click" OnClientClick="/Homework 4/Billing Information.aspx" CausesValidation="true"  />
    </p>

</asp:Content>





