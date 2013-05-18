using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homework_4_Billing_Address : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Continue_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string BillAddress_First = FirstName.Text;
            string BillAddress_Last = LastName.Text;
            string BillAddress_Address = Address.Text;
            string BillAddress_City = City.Text;
            string BillAddress_State = State.SelectedValue;
            string BillAddress_ZipCode = ZipCode.Text;

            Session.Add("Billing First Name",BillAddress_First);
            Session.Add("Billing Last Name", BillAddress_Last);
            Session.Add("Billing Address", BillAddress_Address);
            Session.Add("Billing City", BillAddress_City);
            Session.Add("Billing State", BillAddress_State);
            Session.Add("Billing Zip Code", BillAddress_ZipCode);
            //Server.Transfer("/Homework 4/Billing Information.aspx")

            Response.Redirect("/Homework 4/Billing Information.aspx");
        }
    }

 


}