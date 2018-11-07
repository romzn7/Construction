using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace Construction.Controllers
{
    public class SharedLayoutController : SurfaceController
    {
        private const string PartialViewPath = "~/Views/Partials/SharedLayout/";

        // GET: SharedLayout
        public ActionResult RenderHeader()
        {
            return PartialView(string.Format("{0}Header.cshtml", PartialViewPath));
        }

        public ActionResult RenderFooter()
        {
            return PartialView(string.Format("{0}Footer.cshtml", PartialViewPath));
        }
    }
}