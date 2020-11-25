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
        private int idLocalidad;
        private string email;
        private string pass;

        public Persona()
        {

        }

        public Persona(int id, string nombre, string apellido, string cuit, string direccion, int idLocalidad)
        {
            this.id = id;
            this.nombre = nombre;
            this.apellido = apellido;
            this.cuit = cuit;
            this.direccion = direccion;
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


        public int IdLocalidad
        {
            get { return idLocalidad; }
            set { idLocalidad = value; }
        }

        public string Email { get => email; set => email = value; }

        public string Pass { get => pass; set => pass = value; }
    }
}
