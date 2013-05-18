using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homework_4_ShippingAddress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Next_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            string ShipAddress_First = Ship_FirstName.Text;
            string ShipAddress_Last = Ship_LastName.Text;
            string ShipAddress_Address = Ship_Address.Text;
            string ShipAddress_City = Ship_City.Text;
            string ShipAddress_State = Ship_State.SelectedValue;
            string ShipAddress_ZipCode = Ship_ZipCode.Text;


            Session.Add("Shipping First Name", ShipAddress_First);
            Session.Add("Shipping Last Name", ShipAddress_Last);
            Session.Add("Shipping Address", ShipAddress_Address);
            Session.Add("Shipping City", ShipAddress_City);
            Session.Add("Shipping State", ShipAddress_State);
            Session.Add("Shipping Zip Code", ShipAddress_ZipCode);
            //Server.Transfer("Summary.aspx");

            Response.Redirect("summary.aspx");
        }
    }
}