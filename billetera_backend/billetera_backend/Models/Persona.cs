using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Persona
    {
        private string nombre;
        private string apellido;
        private string cuit;
        private string direccion;
        private string estadoCivil;
        private string idLocalidad;

        public Persona(string nombre, string apellido, string cuit, string direccion, string estadoCivil, string idLocalidad)
        {
            this.nombre = nombre;
            this.apellido = apellido;
            this.cuit = cuit;
            this.direccion = direccion;
            this.estadoCivil = estadoCivil;
            this.idLocalidad = idLocalidad;

        }

        public string Nombre
        {

            get { return nombre; }
            set { nombre = value; }

        }

        public string Apellido
        {

            get { return apellido; }
            set { apellido = value; }

        }

        public string Cuit
        {

            get { return cuit; }
            set { cuit = value; }

        }

        public string Direccion
        {

            get { return direccion; }
            set { direccion = value; }

        }

        public string EstadoCivil
        {

            get { return estadoCivil; }
            set { estadoCivil = value; }

        }

        public string IdLocalidad
        {
            get { return idLocalidad; }
        }

    }
}