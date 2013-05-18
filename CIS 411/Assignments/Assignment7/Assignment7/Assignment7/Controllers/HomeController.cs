using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Assignment7.Models;

namespace Assignment7.Controllers
{
    public class HomeController : Controller
    {

        Assignment7Model model = new Assignment7Model();

        public ActionResult Index()
        {
            ViewBag.Message = "Assignment 7 - Jake Ellis";

            string url = model.Url;
            ViewBag.Message = url;


            return View(model);
        }

    }


}


