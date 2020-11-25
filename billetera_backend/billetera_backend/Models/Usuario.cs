using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class Usuario
    {
        private int id;
        private string nombreUsuario;
        private string pass;
        private int id_persona;

        

        public Usuario(int id, string nombreUsuario, string pass, int id_persona)
        {
            this.id = id;
            this.nombreUsuario = nombreUsuario;
            this.pass = pass;
            this.id_persona = id_persona;
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