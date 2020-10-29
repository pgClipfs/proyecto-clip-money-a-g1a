using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Extraccion: Operacion
    {
        public Extraccion(decimal monto, DateTime fecha, string codigo) : base(monto, fecha, codigo)
        {

        }
    }
}