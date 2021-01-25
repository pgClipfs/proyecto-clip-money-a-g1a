using billetera_backend.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
//using System.Web.Mvc;

namespace billetera_backend.Controllers
{
    [RoutePrefix("api/email")]
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class EmailController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Sendmail()
        {
             return Ok("Funciona");
        }


        [HttpPost]
        public Email Sendmail(Email email)
        {
            string subject = "Correo de verificación";
            string to = email.Mail;
            string body = "Test si funciona, abram es un genio";

            MailMessage mm = new MailMessage()
            {
                From = new MailAddress("soporte.m.clip@gmail.com"),
                Subject = subject,
                Body = body,
                IsBodyHtml = false
            };
            mm.To.Add(to);

            SmtpClient smtp = new SmtpClient();
            smtp.Send(mm);

            return email;
        }
    }
}
