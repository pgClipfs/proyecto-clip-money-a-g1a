using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Transferencia: Operacion
    {
        private string cbuDestinatario;
        private string aliasDestinatario;


        public Transferencia(decimal monto, DateTime fecha, int codigo, string cbuDestinatario, string aliasDestinatario) : base(monto, fecha, codigo)
        {
            this.cbuDestinatario = cbuDestinatario;
            this.aliasDestinatario = aliasDestinatario;
        }

        public string CbuDestinario
        {
            get { return cbuDestinatario; }
        }

        public string AliasDestinatario
        {
            get { return aliasDestinatario; }
        }
    }
}