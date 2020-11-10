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
                    string estado_civil = dr.GetString(6).Trim();

                    Persona p = new Persona(id, nombre, apellido, cuit, direccion, id_localidad, estado_civil);
                    lista.Add(p);
                }

                dr.Close();


                return lista;

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
                    string estado_civil = dr.GetString(6).Trim();

                    p = new Persona(id, nombre, apellido, cuit, direccion, id_localidad,estado_civil);
                }

                dr.Close();
            }

            return p;

        }
    }
}