using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net.Mime;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Threading.Tasks;

namespace billetera_backend.Models
{
    public class GestorEmail
    {
        public void Mail()
        {

            
          
            Execute().Wait();
           

            async Task Execute()
            {
                var apiKey = Environment.GetEnvironmentVariable("SENDGRID_API_KEY");
                var client = new SendGridClient(apiKey);
                var from = new EmailAddress("aletorancio35@gmail.com", "Example User");
                var subject = "Sending with SendGrid is Fun";
                var to = new EmailAddress("aletorancio35@gmail.com", "Example User");
                var plainTextContent = "and easy to do anywhere, even with C#";
                var htmlContent = "<strong>and easy to do anywhere, even with C#</strong>";
                var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                var response = await client.SendEmailAsync(msg);
            }




            //try
            //{
            //    MailMessage mailMsg = new MailMessage();

            //    // To
            //    mailMsg.To.Add(new MailAddress("aletorancio35@gmail.com", "Alejandro"));

            //    // From
            //    mailMsg.From = new MailAddress("aletorancio35@gmail.com", "MoneyClip");

            //    // Subject and multipart/alternative Body
            //    mailMsg.Subject = "subject";
            //    string text = "text body";
            //    string html = @"<p>html body</p>";
            //    mailMsg.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(text, null, MediaTypeNames.Text.Plain));
            //    mailMsg.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(html, null, MediaTypeNames.Text.Html));

            //    // Init SmtpClient and send
            //    SmtpClient smtpClient = new SmtpClient("smtp.sendgrid.net", Convert.ToInt32(587));
            //    System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("aletorancio35@gmail.com", "e1e99b62bamshc3036fb47996628p1e5f8ajsn96db0c103a08");
            //    smtpClient.Credentials = credentials;

            //    smtpClient.Send(mailMsg);
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine(ex.Message);
            //}

        }
    }
}