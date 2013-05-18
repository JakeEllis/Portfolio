using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Assignment7_JE.Models;

namespace Assignment7_JE.Controllers
{
    public class HomeController : Controller
    {
        URLmodel model = new URLmodel();

        //
        // GET: /Home/

        
        public ActionResult Index()
        {
            return View();
        }
        
        
        public JsonResult GetURL()
        {
            var url = model.JSON_URL;

            return Json(url);

        }

   
    }
}
