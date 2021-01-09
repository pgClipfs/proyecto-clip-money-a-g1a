using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Giro: Operacion
    {
        public Giro(decimal monto, DateTime fecha, int codigo) : base(monto, fecha, codigo)
        {

        }
    }
}