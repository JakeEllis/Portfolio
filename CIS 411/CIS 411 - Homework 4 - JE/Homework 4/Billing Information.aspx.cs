using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homework_4_Billing_Information : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Submit_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            string BillInfo_CardNum = BillInfo_CardNumber.Text;
            string BillInfo_ExpMonth = Month.SelectedValue;
            string BillInfo_ExpYear = Year.SelectedValue;

            Session.Add("Billing Card Number", BillInfo_CardNum);
            Session.Add("Billing Month", BillInfo_ExpMonth);
            Session.Add("Billing Year", BillInfo_ExpYear);

            //Server.Transfer("/Homework 4/Shipping.aspx");
            Response.Redirect("/Homework 4/Shipping.aspx");
           
        }
    }
}


