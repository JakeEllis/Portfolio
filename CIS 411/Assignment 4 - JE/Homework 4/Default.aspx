<%@ Page Title="Home" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Home</h1>
                <h2>Homework 4 - Jake Ellis</h2>
            </hgroup>
            <p>
                
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ol class="round">
        <li class="one">
            <h5>Checkout</h5>
            Here is the link to the first step of the billing process. Please enter your billing address, billing information, shipping address, and payment information.
            <a href="Billing Address.aspx">Checkout</a>
        </li>   
    </ol>
</asp:Content>
