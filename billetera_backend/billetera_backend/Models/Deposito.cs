using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class Deposito : Operacion
    {
        public Deposito(decimal monto, DateTime fecha, int codigo) : base(monto, fecha, codigo)
        {

        }
    }
}