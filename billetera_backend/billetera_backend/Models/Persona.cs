using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class Persona
    {
        private int id;
        private string nombre;
        private string apellido;
        private string cuit;
        private string direccion;
        private string estadoCivil;
        private int idLocalidad;

        public Persona()
        {

        }

        public Persona(int id, string nombre, string apellido, string cuit, string direccion, int idLocalidad, string estadoCivil)
        {
            this.id = id;
            this.nombre = nombre;
            this.apellido = apellido;
            this.cuit = cuit;
            this.direccion = direccion;
            this.estadoCivil = estadoCivil;
            this.idLocalidad = idLocalidad;

        }

        public int Id
        {
            get { return id; }
            set { id = value; }
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

        public int IdLocalidad
        {
            get { return idLocalidad; }
            set { idLocalidad = value; }
        }
    }
}