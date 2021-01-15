using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Send_Mail_Webapi.Models;
using System.Net.Mail;

namespace billetera_backend.Controllers
{
    public class EmailController : ApiController
    {
        public IHttpActionResult sendmail(EmailClass ec)
        {
            string subject = ec.subject;
            string to = ec.to;
            string body = ec.body;

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("CORREO@ELECTRONICO.COM");
            mm.To.Add(to);
            mm.Subject = subject;
            mm.Body = body;
            mm.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.UseDefaultCredentials = true;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new System.Net.NetworkCredential("money@clip.com", "password");
            smtp.Send(mm);

            return Ok();
        }
    }
}
