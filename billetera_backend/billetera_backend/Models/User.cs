using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string Pass { get; set; }
    }
}