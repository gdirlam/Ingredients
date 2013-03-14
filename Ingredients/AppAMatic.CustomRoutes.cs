









using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;


namespace AppAMatic {
    public class CustomRoutes {
        public static void RestfulDataRoutes(ref RouteCollection routes) {

	//admin
	#region "Restful Routes for admin Schema"

	#endregion
				
	//dbo
	#region "Restful Routes for dbo Schema"

	#endregion
				
	//fn
	#region "Restful Routes for fn Schema"

	#endregion
				
	//Products
	#region "Restful Routes for Products Schema"

            routes.MapRoute(
                "DataProducts"
                , "Data/Products/{controller}/{id}"
                , new { controller = "Data", action = "Default", id = UrlParameter.Optional }
                , new[] { "Food.Controllers.Data.Products" }
           );


	#endregion
				
}
}
}
