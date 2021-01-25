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
//using System.Web.Mvc;

namespace billetera_backend.Controllers
{
    [RoutePrefix("api/email")]
    public class EmailController : ApiController
    {
        public void Get()
        {

        }

        public void Post()
        {
            GestorEmail gestor = new GestorEmail();
            gestor.Mail();
        }

 

        //[HttpPost]
        //private void SendEmail()
        //{
        //    string subject = "Email Subject";
        //    string body = "Hola soy un texto de prueba";
        //    string FromMail = "aletorancio35@gmail.com";
        //    string emailTo = "aletorancio35@gmail.com";
        //    MailMessage mail = new MailMessage();
        //    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
        //    mail.From = new MailAddress(FromMail);
        //    mail.To.Add(emailTo);
        //    mail.Subject = subject;
        //    mail.Body = body;
        //    SmtpServer.Port = 587;
        //    SmtpServer.Credentials = new NetworkCredential("aletorancio35@gmail.com", "nadiemepara");
        //    SmtpServer.EnableSsl = true;
        //    SmtpServer.Send(mail);
        //}


    }
}
