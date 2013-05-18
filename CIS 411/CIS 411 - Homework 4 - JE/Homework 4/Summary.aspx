<%@ Page Title="Summary" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Summary.aspx.cs" Inherits="Homework_4_Summary" %>

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
    
    <table id="display" runat="server">
        
        <tr><td><h1>Billing Address</h1></td></tr>
        
        <tr>
            <td>
                First name:   <%=Session["Billing First Name"].ToString()%>
            </td>
            </tr>
        <tr>
             <td>
                Last name:    <%=Session["Billing Last Name"].ToString()%>
            </td>
        </tr>

        <tr>
             <td>
                Address:     <%=Session["Billing Address"].ToString()%>
            </td>
       </tr>
       
        <tr>
              <td>
                City:        <%=Session["Billing City"].ToString()%>
            </td>
       </tr>    
        
        <tr>    
            <td>
                State:       <%=Session["Billing State"].ToString()%>
            </td>
         </tr>   
       
         <tr>     
            <td>
                Zip Code:   <%=Session["Billing Zip Code"].ToString()%>
            </td>
      </tr>

        <tr>
                             <td><h1>Billing Information</h1></td>
        </tr>   
        
        <tr>
             <td>
                Card Number:  <%=Session["Billing Card Number"].ToString()%>
            </td>
        </tr>    
        
        <tr>     
        <td>
                Month:       <%=Session["Billing Month"].ToString()%>
            </td>
         </tr> 
        
        <tr>  
             <td>
                Year:       <%=Session["Billing Year"].ToString()%>
            </td>
      </tr>
                                <tr><td><h1>Shipping Information</h1></td></tr>
        <tr>
             <td>
                Card Number: <%=Session["Shipping Card Number"].ToString()%>
            </td>
        </tr>
        
        <tr> 
              <td>
                Shipping Type: <%=Session["Shipping Ship Type"].ToString()%>
            </td>
        </tr>   
        
        <tr>   
           <td>
                Ship to Billing Address?: <%=Session["Shipping Ship to Billing"].ToString()%>
            </td>
       </tr>
                            <tr><td><h1>Shipping Address Information</h1></td></tr>
        <tr>
             <td>
                Shipping First Name: <%=Session["Shipping First Name"].ToString()%>
            </td>
       </tr>   
       
        <tr>
             <td>
                Shipping Last Name: <%=Session["Shipping last Name"].ToString()%>
            </td>
        </tr>   
            
        <tr>
         <td>
                Shipping Address: <%=Session["Shipping Address"].ToString()%>
            </td>
        </tr>   
        
        <tr>    
         <td>
                Shipping State: <%=Session["Shipping State"].ToString()%>
            </td>
         </tr>
        <tr>   
            <td>
                Shipping Zip Code: <%=Session["Shipping Zip Code"].ToString()%>
            </td>
         </tr>

        
    </table>

</asp:Content>





