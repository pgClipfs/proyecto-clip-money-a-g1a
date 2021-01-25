using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Giro
    {
        public int Id { get; set; }
        public int Id_Cuenta { get; set; }
        public decimal Monto { get; set; }
        public decimal MontoMax { get; set; }
    }
}