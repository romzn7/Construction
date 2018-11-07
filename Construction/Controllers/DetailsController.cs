using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace Construction.Controllers
{
    public class DetailsController : SurfaceController
    {
        private const string PartialViewPath = "~/Views/Partials/Details/";
        public ActionResult RenderDetails()
        {
            return PartialView(string.Format("{0}Details.cshtml", PartialViewPath));
        }
    }
}