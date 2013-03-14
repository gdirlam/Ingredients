









using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc; 
using System.ComponentModel.DataAnnotations;
using System.Web.Script.Serialization;
using System.Xml.Serialization; 
using AppAMatic; 
using AppAMatic.Helper;
using AppAMatic.Controllers; 


namespace Food.Controllers.Data {





	namespace admin{
	    using  Food.Models.admin;


	}
				
				











	namespace dbo{
	    using  Food.Models.dbo;


	}
				
				


	namespace fn{
	    using  Food.Models.fn;


	}
				
				




	namespace Products{
	    using  Food.Models.Products;


			public class IngredientsController : RestfulController {

				[HttpGet]
				[NotJson]
				public ActionResult Default(int? id) {
					return base.Default<Ingredients>(id); 
				}
			#region "Json GET, PUT, POST, DELETE"


                [HttpOptions]
                [ActionName("Default")]
                public ActionResult OptionsList() {
                    return base.DefaultJson<Ingredients>(null);
                }

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
				

			}


			public class PairingsController : RestfulController {

				[HttpGet]
				[NotJson]
				public ActionResult Default(int? id) {
					return base.Default<Pairings>(id); 
				}
			#region "Json GET, PUT, POST, DELETE"

				[HttpGet]
				[JsonContent]
				[ActionName("Default")]
				public ActionResult DefaultJson(int? id) {
					return base.DefaultJson<Pairings>(id);
				}
        
				[HttpDelete]
				[ActionName("Default")]
				public ActionResult Delete(int? id, Pairings item) {
					return base.Delete<Pairings>(id, item);
				}

				[HttpPut]
				[JsonContent]
				[ActionName("Default")]
				public JsonResult Update(Pairings item) {
					return base.Update<Pairings>(item);
				}

				[HttpPost]
				[JsonContent]
				[ActionName("Default")]
				public JsonResult Post(Ingredients item) {
					return base.Update<Pairings>(item);
				}
			#endregion
				

			}


			public class ProximityController : RestfulController {

				[HttpGet]
				[NotJson]
				public ActionResult Default(int? id) {
					return base.Default<Proximity>(id); 
				}
			#region "Json GET, PUT, POST, DELETE"

				[HttpGet]
				[JsonContent]
				[ActionName("Default")]
				public ActionResult DefaultJson(int? id) {
					return base.DefaultJson<Proximity>(id);
				}
        
				[HttpDelete]
				[ActionName("Default")]
				public ActionResult Delete(int? id, Proximity item) {
					return base.Delete<Proximity>(id, item);
				}

				[HttpPut]
				[JsonContent]
				[ActionName("Default")]
				public JsonResult Update(Proximity item) {
					return base.Update<Proximity>(item);
				}

				[HttpPost]
				[JsonContent]
				[ActionName("Default")]
				public JsonResult Post(Ingredients item) {
					return base.Update<Proximity>(item);
				}
			#endregion
				

			}


			public class TypesController : RestfulController {

				[HttpGet]
				[NotJson]
				public ActionResult Default(int? id) {
					return base.Default<Types>(id); 
				}
			#region "Json GET, PUT, POST, DELETE"

				[HttpGet]
				[JsonContent]
				[ActionName("Default")]
				public ActionResult DefaultJson(int? id) {
					return base.DefaultJson<Types>(id);
				}
        
				[HttpDelete]
				[ActionName("Default")]
				public ActionResult Delete(int? id, Types item) {
					return base.Delete<Types>(id, item);
				}

				[HttpPut]
				[JsonContent]
				[ActionName("Default")]
				public JsonResult Update(Types item) {
					return base.Update<Types>(item);
				}

				[HttpPost]
				[JsonContent]
				[ActionName("Default")]
				public JsonResult Post(Ingredients item) {
					return base.Update<Types>(item);
				}
			#endregion
				

			}


	}
				
				


}
