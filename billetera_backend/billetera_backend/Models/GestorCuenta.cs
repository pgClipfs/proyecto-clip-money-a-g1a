using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class GestorCuenta
    {


        public Cuenta ObtenerPorId( int id)
        {
            Cuenta cuenta = null;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("select *from cuenta", conn);
                //comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    
                    string estado = dr.GetString(1).Trim();
                    decimal saldo = dr.GetDecimal(2);
                    int nroCuenta = dr.GetInt32(3);
                    string alias = dr.GetString(4).Trim();
                    long cbu = dr.GetInt64(5);
                    string moneda = dr.GetString(6).Trim();
                    

                    cuenta = new Cuenta(estado,saldo,nroCuenta,alias,cbu,moneda);
                    //p = new Persona(id, nombre, apellido, cuit, direccion, id_localidad);
                }

                dr.Close();
            }

            return cuenta;
        }
    }
}