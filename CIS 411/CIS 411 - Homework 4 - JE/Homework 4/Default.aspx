<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h2>Homework 4 - Jake Ellis</h2>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   
    <ol class="round">
        <li class="one">
            <h5>CHECKOUT</h5>
            Please process to checkout. This will take you through the steps of gathering billing address, billing information, shipping information, and payment information.
            <a href="/Homework 4/Billing Address.aspx">Checkout</a>
        </li>
    </ol>
</asp:Content>