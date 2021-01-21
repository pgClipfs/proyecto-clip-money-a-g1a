using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
//using Send_Mail_Webapi.Models;
using System.Net.Mail;
using billetera_backend.Models;

namespace billetera_backend.Controllers
{
    public class EmailController : ApiController
    {
        [HttpPost]
        public IHttpActionResult SendMailTo(EmailClass ec)
        {
            string subject = ec.subject;
            string to = ec.to;
            string body = ec.body;

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("soporte.m.clip@gmail.com");
            mm.To.Add(to);
            mm.Subject = subject;
            mm.Body = body;
            mm.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.UseDefaultCredentials = true;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("soporte.m.clip@gmail.com", "g1ADw3aCDeHm");
            smtp.Send(mm);

            return Ok();
        }

        public void Recuperar(string destinatario)
        {
            EmailClass mailBase = new EmailClass
            {
                to = destinatario,
                subject = "Recuperación de cuenta/contraseña",
                body = "Cuenta recuperada"
            };

            SendMailTo(mailBase);
        }

        public void Verificar(string destinatario)
        {
            EmailClass mailBase = new EmailClass
            {
                to = destinatario,
                subject = "Verificación de cuenta",
                body = "Verifique su cuenta"
            };

            SendMailTo(mailBase);
        }

    }
}
