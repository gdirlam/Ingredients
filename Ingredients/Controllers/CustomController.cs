using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Serialization;
using System.Xml;
using System.Text;
using System.IO; 

namespace Food.Controllers {
    /// <summary>
    /// Customer Controller 
    /// </summary>
    /// <remarks>
    /// Using Action Method Selector, this allows custom decroations on the action methods.
    /// Like [Json] below.  
    /// </remarks>
    public class CustomController : Controller {


        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <lift>http://stackoverflow.com/questions/1564718/using-stringwriter-for-xml-serialization</lift>
        /// <returns></returns>
        public static string SerializeToXML<T>(T value) {

            if (value == null) {
                return null;
            }

            XmlSerializer serializer = new XmlSerializer(typeof(T));

            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Encoding = new UnicodeEncoding(false, false); // no BOM in a .NET string
            settings.Indent = false;
            settings.OmitXmlDeclaration = false;

            using (StringWriter textWriter = new StringWriter()) {
                using (XmlWriter xmlWriter = XmlWriter.Create(textWriter, settings)) {
                    serializer.Serialize(xmlWriter, value);
                }
                return textWriter.ToString();
            }
        }

        public class JsonContent : ActionMethodSelectorAttribute {

        public override bool IsValidForRequest(
            ControllerContext controllerContext
            , System.Reflection.MethodInfo methodInfo) {

            var Request = controllerContext.HttpContext.Request;
            string requestedWith = Request.ServerVariables["HTTP_X_REQUESTED_WITH"] ?? string.Empty;
            return string.Compare(requestedWith, "XMLHttpRequest", true) == 0
                && Request.ContentType.ToLower().Contains("application/json");
        }
        }
        public class NotJson : ActionMethodSelectorAttribute {

            public override bool IsValidForRequest(
                ControllerContext controllerContext
                , System.Reflection.MethodInfo methodInfo) {

                var Request = controllerContext.HttpContext.Request;
                string requestedWith = Request.ServerVariables["HTTP_X_REQUESTED_WITH"] ?? string.Empty;
                bool isJson =  string.Compare(requestedWith, "XMLHttpRequest", true) == 0
                        && Request.ContentType.ToLower().Contains("application/json");

                return !isJson; 

            }
        }
    }
}