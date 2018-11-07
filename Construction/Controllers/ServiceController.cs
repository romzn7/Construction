using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace Construction.Controllers
{
    public class ServiceController : SurfaceController
    {
        private const string PartialViewPath = "~/Views/Partials/Services/";

        public ActionResult RenderServices()
        {
            return PartialView(string.Format("{0}Services.cshtml", PartialViewPath));
        }
    }
}