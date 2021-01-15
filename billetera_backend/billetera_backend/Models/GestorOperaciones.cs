using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class GestorOperaciones
    {

        public List<Operacion> ObtenerPorId ( int id)
        {
            List<Operacion> operacion = new List<Operacion>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("select id, monto, fecha, id_tipo_operacion from operacion", conn);
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();

               

                while (dr.Read())

                { 
                        decimal monto = dr.GetDecimal(1);
                        DateTime fecha = dr.GetDateTime(2);
                 
                        int codigo = dr.GetInt16(3);

                    
                   

                   Operacion op = new Operacion(monto, fecha, codigo);
                    operacion.Add(op);

                }

                dr.Close();
            }

            return operacion;
        }

    }
}