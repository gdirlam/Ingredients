using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Food.Controllers {
    public class TypeController : Controller {


        public ActionResult Index(string name) {
            if( string.IsNullOrEmpty ( name ) ) {
                return View("List", (object)name);
            } else {
                return View("Item", (object)name);
            }
        }

        public ActionResult Default(string name, string operation) {
            return View("Default",  new { name = name, operation = operation });
        }

        //
        // GET: /Type/Details/5
        /*
        public ActionResult Index(int id) {
            return View();
        }
        */

    }

}
