using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class Usuario
    {
        private string nombreUsuario;
        private string pass;

        public Usuario(string nombreUsuario, string pass)
        {
            this.nombreUsuario = nombreUsuario;
            this.pass = pass;
        }

        public string NombreUsuario
        {
            get { return NombreUsuario; }
            set { nombreUsuario = value; }
        }

        public string Pass
        {
            get { return pass; }
            set { pass = value; }
        }
    }
}