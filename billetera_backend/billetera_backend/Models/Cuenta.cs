using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class Cuenta
    {
        
        private string estado;
        private decimal saldo;
        private int nroCuenta;
        private string alias;
        private long cbu;
        private string moneda;

        public Cuenta( string estado, decimal saldo, int nroCuenta, string alias, long cbu, string moneda)
        {
            
            this.estado = estado;
            this.saldo = saldo;
            this.nroCuenta = nroCuenta;
            this.cbu = cbu;
            this.alias = alias;
            this.moneda = moneda;

        }

     
        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public decimal Saldo
        {
            get { return saldo; }
            set { saldo = value; }
        }

        public int NroCuenta
        {
            get { return nroCuenta; }
            set { nroCuenta = value; }
        }

        public string Alias
        {
            get { return alias; }
        }

        public long Cbu
        {
            get { return cbu; }
            set { cbu = value; }
        }

        public string Moneda
        {
            get { return moneda; }
            set { moneda = value; }
        }
    }
}