using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class Operacion
    {
        private decimal monto;
        private DateTime fecha;
        private string codigo;

        public Operacion(decimal monto, DateTime fecha, string codigo)
        {
            this.monto = monto;
            this.fecha = fecha;
            this.codigo = codigo;
        }

        public decimal Monto
        {
            get { return monto; }
            set { monto = value; }
        }

        public DateTime Fecha
        {
            get { return fecha; }
        }

        public string Codigo
        {
            get { return codigo; }
        }
    }
}