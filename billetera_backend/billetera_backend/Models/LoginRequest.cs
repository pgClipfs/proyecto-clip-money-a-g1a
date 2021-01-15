using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class LoginRequest
    {
        
        private string username;
        private string password;
        

        public LoginRequest(string username, string password)
        {
     
            this.username = username;
            this.password = password;
       
        }

      
        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }

  
    }
}