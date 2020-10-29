using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Deposito: Operacion
    {
        public Deposito(decimal monto, DateTime fecha, string codigo) : base(monto, fecha, codigo)
        {

        }
    }
}