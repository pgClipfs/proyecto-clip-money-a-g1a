using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class GestorPersona
    {
        public int AgregarPersona(Persona nueva)
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            int id = 0;

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_persona";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", nueva.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", nueva.Apellido));
                comm.Parameters.Add(new SqlParameter("@email", nueva.Email));
                comm.Parameters.Add(new SqlParameter("@pass", nueva.Pass));
           

                id = Convert.ToInt32(comm.ExecuteScalar());
            }
            return id;
        }
        public List<Persona> ObtenerPersonas()
        {
            List<Persona> lista = new List<Persona>();

            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_personas";
                comm.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    string cuit = dr.GetString(3).Trim();
                    string direccion = dr.GetString(4).Trim();
                    int id_localidad = dr.GetInt32(5); 
                    

                    Persona p = new Persona(id, nombre, apellido, cuit, direccion, id_localidad);
                    lista.Add(p);
                }

                dr.Close();


                return lista;

            }
        }

        public void Eliminar(int id)
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("eliminar_persona", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                comm.ExecuteNonQuery();
            }

        }

        public Persona ObtenerPorId(int id)
        {
            Persona p = null;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("obtener_persona", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    string cuit = dr.GetString(3).Trim();
                    string direccion = dr.GetString(4).Trim();
                    int id_localidad = dr.GetInt32(5);
                   

                    p = new Persona(id, nombre, apellido, cuit, direccion, id_localidad);
                }

                dr.Close();
            }

            return p;

        }

        public void ModificarPersona(Persona p)
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "modificar_persona";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", p.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", p.Apellido));
                comm.Parameters.Add(new SqlParameter("@cuit", p.Cuit));
                comm.Parameters.Add(new SqlParameter("@direccion", p.Direccion));
                comm.Parameters.Add(new SqlParameter("@id_localidad", p.IdLocalidad));
                
                comm.Parameters.Add(new SqlParameter("@id", p.Id));

                comm.ExecuteNonQuery();


            }
        }
    }
}