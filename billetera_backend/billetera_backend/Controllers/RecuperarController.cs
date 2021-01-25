﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Net.Mail;
using System.Web.Http.Cors;

namespace billetera_backend.Controllers
{
    public class RecuperarController : ApiController
    {
        [EnableCors(origins: "*", headers: "*", methods: "*")]

        //[HttpGet]
        //public IHttpActionResult SendMail() 
        //{
        //    return Ok("funca");
        //}

        [HttpGet]
        public void Sendmail(string mail)
        {
            string subject = "Recuperación de Credenciales";
            string to = mail;
            string body = "Su contraseña fue restaurada.";

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
        }
    }
}
