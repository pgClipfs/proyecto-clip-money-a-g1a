using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
                comm.CommandText = "SELECT *FROM PERSONA";
                //comm.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    Persona persona = new Persona
                    {
                        Id = int.Parse(dr["id"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Apellido = dr["apellido"].ToString(),
                        Direccion = dr["direccion"].ToString(),
                        Cuit = dr["cuit"].ToString(),
                        Celular = dr["celular"].ToString(),
                        Foto = dr["foto"].ToString(),
                        Email = dr["email"].ToString(),
                        Pass = dr["pass"].ToString(),
                        Provincia = dr["provincia"].ToString(),
                        Localidad = dr["localidad"].ToString(),
                        Sexo = dr["sexo"].ToString(),
                    };
                    lista.Add(persona);
                    //int id = dr.GetInt32(0);
                    //string nombre = dr.GetString(1).Trim();
                    //string apellido = dr.GetString(2).Trim();
                    //string email = dr.GetString(3).Trim();
                    //string pass = dr.GetString(4).Trim();
                    ////int id_localidad = dr.GetInt32(5); 
                    

                    //Persona p = new Persona(id, nombre, apellido, email, pass);
                    //lista.Add(p);
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
            Persona persona = new Persona();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("SELECT *FROM PERSONA WHERE @id = id", conn);
                //comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();
                
                

                if (dr.Read())
                {

                    persona.Id = int.Parse(dr["id"].ToString());
                    persona.Nombre = dr["nombre"].ToString();
                    persona.Apellido = dr["nombre"].ToString();
                    persona.Direccion = dr["nombre"].ToString();
                    persona.Cuit = dr["nombre"].ToString();
                    persona.Provincia = dr["nombre"].ToString();
                    persona.Localidad = dr["nombre"].ToString();
                    persona.Sexo = dr["nombre"].ToString();
                    persona.Foto = dr["nombre"].ToString();
                    persona.Email = dr["nombre"].ToString();
                    persona.Pass = dr["nombre"].ToString();
                    persona.Celular = dr["nombre"].ToString();

                }

                dr.Close();
            }

            return persona;

        }

        public int ModificarPersona(Persona p)
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "UPDATE persona Set cuit = @cuit, celular = @celular, direccion = @direccion, localidad = @localidad, provincia = @provincia WHERE @id = id";
                //comm.CommandType = System.Data.CommandType.StoredProcedure;
              
                comm.Parameters.Add("@cuit", SqlDbType.VarChar);
                comm.Parameters["@cuit"].Value = p.Cuit;
                comm.Parameters.Add("@celular", SqlDbType.VarChar);
                comm.Parameters["@celular"].Value = p.Celular;
                comm.Parameters.Add("@direccion", SqlDbType.VarChar);
                comm.Parameters["@direccion"].Value = p.Direccion;
                comm.Parameters.Add("@localidad", SqlDbType.VarChar);
                comm.Parameters["@localidad"].Value = p.Localidad;
                comm.Parameters.Add("@provincia", SqlDbType.VarChar);
                comm.Parameters["@provincia"].Value = p.Provincia;
                comm.Parameters.Add("@id", SqlDbType.Int);
                comm.Parameters["@id"].Value = p.Id;


                
                conn.Open();
                int i = comm.ExecuteNonQuery();
                conn.Close();
                return i;


            }
        }
    }
}