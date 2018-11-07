using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace Construction.Controllers
{
    public class HomeController : SurfaceController
    {
        private const string PartialViewPath = "~/Views/Partials/Home/";
        // GET: Home
        public ActionResult RenderBanner()
        {
            return PartialView(string.Format("{0}Banner.cshtml", PartialViewPath));
        }
        public ActionResult RenderWelcome()
        {
            return PartialView(string.Format("{0}Welcome.cshtml", PartialViewPath));
        }
        public ActionResult RenderWhyChooseUs()
        {
            return PartialView(string.Format("{0}WhyChooseUs.cshtml", PartialViewPath));
        }
        public ActionResult RenderServices()
        {
            return PartialView(string.Format("{0}Services.cshtml", PartialViewPath));
        }
        public ActionResult RenderCustomer()
        {
            return PartialView(string.Format("{0}Customer.cshtml", PartialViewPath));
        }
        public ActionResult RenderMadeWithLove()
        {
            return PartialView(string.Format("{0}MadeWithLove.cshtml", PartialViewPath));
        }
        public ActionResult RenderContact()
        {
            return PartialView(string.Format("{0}Contact.cshtml", PartialViewPath));
        }
    }
}