using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homework_4_Shipping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Shipping_Submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string Shipping_CardNum = CardNumber.Text;
            string Shipping_ShipType = ShippingType.SelectedValue;
            string Shipping_ShipToBill = ShipToBilling.Text;

            Session.Add("Shipping Card Number", Shipping_CardNum);
            Session.Add("Shipping Ship type", Shipping_ShipType);
            Session.Add("Shipping Ship to Billing", Shipping_ShipToBill);

            //Server.Transfer("/Homework 4/ShippingAddress.aspx");
            Response.Redirect("/Homework 4/ShippingAddress.aspx");
        }

    }

}
