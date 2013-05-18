using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homework_4_Summary : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        //Billing address fields
        string BillAddress_firstName = (string)(Session["Billing First Name"]);
        string BillAddress_lastName = (string)(Session["Billing Last Name"]);
        string BillAddress_address = (string)(Session["Billing Address"]);
        string BillAddress_city = (string)(Session["Billing City"]);
        string BillAddress_state = (string)(Session["Billing State"]);
        string BillAddress_zipCode = (string)(Session["Billing Zip Code"]);
    
    //Billing Information fields
        string BillInfo_CardNum = (string)(Session["Billing Card Number"]);
        string BillInfo_Month = (string)(Session["Billing Month"]);
        string BillInfo_Year = (string)(Session["Billing Year"]);

   //Shipping page fields
        string Shiping_CardNum = (string)(Session["Shipping Card Number"]);
        string Shiping_ShipType = (string)(Session["Shipping Ship type"]);
        string Shiping_ShipToBill = (string)(Session["Shipping Ship to Billing"]);

   //Shipping Address
        string ShipAddress_firstName = (string)(Session["Shipping First Name"]);
        string ShipAddress_lastName = (string)(Session["Shipping Last Name"]);
        string ShipAddress_address = (string)(Session["Shipping Address"]);
        string ShipAddress_city = (string)(Session["Shipping City"]);
        string ShipAddress_state = (string)(Session["Shipping State"]);
        string ShipAddress_zipCode = (string)(Session["Shipping Zip Code"]);
    
    
    
    
    }
}


