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
        private string email;
        private string pass;
        private string sexo;
        private string celular;
        private string foto;
        private string localidad;
        private string provincia;



        //public Persona(int id, string nombre, string apellido, string email, string pass )
        //{
        //    this.id = id;
        //    this.nombre = nombre;
        //    this.apellido = apellido;
        //    //this.cuit = cuit;
        //    //this.direccion = direccion;
        //    this.pass = pass;
        //    this.email = email;
            

        //}

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


      

        public string Email { get => email; set => email = value; }

        public string Pass { get => pass; set => pass = value; }
        public string Sexo { get => sexo; set => sexo = value; }
        public string Celular { get => celular; set => celular = value; }
        public string Foto { get => foto; set => foto = value; }
        public string Localidad { get => localidad; set => localidad = value; }
        public string Provincia { get => provincia; set => provincia = value; }
    }
}
