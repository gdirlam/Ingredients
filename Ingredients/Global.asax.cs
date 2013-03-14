using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
//using RouteDebug; 


namespace Food {
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters) {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes) {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            AppAMatic.CustomRoutes.RestfulDataRoutes(ref routes);

            /*
            routes.MapRoute(
                "Type", "Type/{name}", // name, match expression 
                new { controller = "Type", action = "Index", name = UrlParameter.Optional } // Parameter defaults
                , new { name = "|Beef|Bread|Chili|Diary|Extract|Fish|Fruit|Game|Game Meat|Lamb|Goat|Lamb/-Goat|Oil|Offal|Chicken|Poultry|Spice|Starch|Pork|Swine|Vegtable" }
                );
            
            routes.MapRoute(
                "TypeAction", "Type/{name}/{operation}", // name, match expression 
                new { controller = "Type", action = "Default", name = UrlParameter.Optional, operation = UrlParameter.Optional } // Parameter defaults
            );
             * */
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
                , new[] { "Food.Controllers" }

                );

        }

        protected void Application_Start() {
            RouteTable.Routes.Clear();
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }
    }
}