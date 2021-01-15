using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Send_Mail_Webapi_Models;
using System.Net.Http;

namespace billetera_backend.Controllers
{
    public class MailSenderController : Controller
    {
        // GET: MailSender
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(EmailClass ec)
        {
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("localhost:PUERTO/api/Email");

            var consumewebapi = hc.PostAsJsonAsync<EmailClass>("Email", ec);
            consumewebapi.Wait();

            var sendMail = consumewebapi.Result;
            if (sendMail.IsSuccessStatusCode)
            {
                ViewBag.Message = "Correo enviado a " + ec.to.ToString();
            }
            return View();
        }
    }
}