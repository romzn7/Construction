using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace Construction.Controllers
{
    public class WhyChooseUsController : SurfaceController
    {
        private const string PartialViewPath = "~/Views/Partials/WhyChooseUs/";

        public ActionResult RenderWhyChooseUs()
        {
            return PartialView(string.Format("{0}WhyChooseUs.cshtml", PartialViewPath));
        }
    }
}