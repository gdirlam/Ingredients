using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace AppAMatic {
    public class CustomRoutes {
        public static void RegisterDataRoutes(ref RouteCollection routes) {

            routes.MapRoute(
                "DataProducts"
                , "Data/Products/{controller}/{id}"
                , new { controller = "Data", action = "Default", id = UrlParameter.Optional }
                , new[] { "Food.Controllers.Data.Products" }
           );
            /*
           routes.MapRoute(
                "Data"
                , "Data/{controller}/{id}"
                , new { controller = "Data", action = "Default", id = UrlParameter.Optional }
                , new[] { "Food.Controllers.Data" }
           );
        */
        }
    }
}