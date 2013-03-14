using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AppAMatic.Helper;
using System.Net;
using System.Data.SqlClient;

//DATA NAMESPACE!!!
namespace Food.Controllers.Data.Extras {
    using Food.Models.Products;
    public class IngredientsController : Food.Controllers.RestfulController {

        [HttpGet]
        [NotJson]
        public ActionResult Default(int? id) {
            return base.Default<Ingredients>(id); 
        }
        #region "Json GET, PUT, POST, DELETE"

        [HttpGet]
        [JsonContent]
        [ActionName("Default")]
        public ActionResult DefaultJson(int? id) {
            return base.DefaultJson<Ingredients>(id);
        }
        
        [HttpDelete]
        [ActionName("Default")]
        public ActionResult Delete(int? id, Ingredients item) {
            return base.Delete<Ingredients>(id, item);
        }

        [HttpPut]
        [JsonContent]
        [ActionName("Default")]
        public JsonResult Update(Ingredients item) {
            return base.Update<Ingredients>(item);
        }

        [HttpPost]
        [JsonContent]
        [ActionName("Default")]
        public JsonResult Post(Ingredients item) {
            return base.Update<Ingredients>(item);
        }
        #endregion
        
        
        /*
        /// <summary>
        /// Any Non-Json requests will return XML.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [NotJson]
        public ActionResult Default(int? id) {
            if (id <= 0 || id == null) {
                try {
                    List<Ingredients> ingredients = (new Ingredients()).GetInParallel<Ingredients>();
                    this.Response.StatusCode = 200;
                    this.Response.StatusDescription = "OK";
                    return this.Content(SerializeToXML<List<Ingredients>>(ingredients).ToString(), "text/xml");
                } catch (SqlException) {
                    return new HttpStatusCodeResult(404, "Not Found");
                } catch (Exception) {
                    return new HttpStatusCodeResult(400, "Bad Request");
                }
            } else {
                try {
                    Ingredients ingredient = (new Ingredients()).Get<Ingredients>((int)id);
                    this.Response.StatusCode = 200;
                    this.Response.StatusDescription = "OK";
                    return this.Content(SerializeToXML<Ingredients>(ingredient), "text/xml");
                } catch (SqlException) {
                    return new HttpStatusCodeResult(404, "Not Found");
                } catch (Exception) {
                    return new HttpStatusCodeResult(400, "Bad Request");
                }



            }
        }
*/


        /*
        /// <summary>
        /// GET: Index; Content-Type: application/json
        /// List Singleton, List Array
        /// </summary>
        /// <verb>GET</verb>
        /// <returns></returns>
        [HttpGet]
        [JsonContent]
        [ActionName("Default")]
        public ActionResult DefaultJson(int? id) {
            if (id <= 0 || id == null) {
                try {
                    List<Ingredients> ingredients = (new Ingredients()).GetInParallel<Ingredients>();
                    this.Response.StatusCode = 200;
                    this.Response.StatusDescription = "OK";
                    return Json(ingredients, JsonRequestBehavior.AllowGet);
                } catch (SqlException) {
                    return new HttpStatusCodeResult(404, "Not Found");
                } catch (Exception) {
                    return new HttpStatusCodeResult(400, "Bad Request");
                }

            } else {
                try {
                    Ingredients ingredient = (new Ingredients()).Get<Ingredients>((int)id);
                    this.Response.StatusCode = 200;
                    this.Response.StatusDescription = "OK";
                    return Json(ingredient, JsonRequestBehavior.AllowGet);
                } catch (SqlException) {
                    return new HttpStatusCodeResult(404, "Not Found");
                } catch (Exception) {
                    return new HttpStatusCodeResult(400, "Bad Request");
                }

            }
        }

        [HttpDelete]
        [ActionName("Default")]
        public ActionResult Delete(int? id, Ingredients ingredient) {
            int? Pk = ingredient.Ingredient_pk ?? id;

                if (Pk != null && Pk > 0) {
                    try {
                        Ingredients ing = (new Ingredients()).Get<Ingredients>((int)Pk);
                        ing.Ingredient_pk = Pk;
                        try {
                            ing.Delete();
                        } catch (Exception) {
                            return new HttpStatusCodeResult(505, "Found but not deleted");
                        }
                    } catch (SqlException) {
                        return new HttpStatusCodeResult(404, "Not Found");
                    } catch (Exception) {
                        return new HttpStatusCodeResult(400, "Bad Request");
                    }

                    return new HttpStatusCodeResult(204, "No Content");
                } else {
                    return new HttpStatusCodeResult(404, "Not Found");
                }
        }
                 [HttpPut]
        [JsonContent]
        [ActionName("Default")]
        public JsonResult Update(Ingredients ingredient) {
            int? Pk = ingredient.Ingredient_pk;

            if (Pk != null && Pk > 0) {

                ingredient.Update();
            } else {
                ingredient.Create();
            }
            return Json(ingredient, JsonRequestBehavior.AllowGet);
        } 

        [HttpPost]
        [JsonContent]
        [ActionName("Default")]
        public JsonResult Post(Ingredients ingredient) {
            return Update(ingredient);
        }
          
         */






    }
}
