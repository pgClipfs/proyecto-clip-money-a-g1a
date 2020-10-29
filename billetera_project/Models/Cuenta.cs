using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_project.Models
{
    public class Cuenta
    {
        private string estado;
        private decimal saldo;
        private string nroCuenta;
        private string alias;
        private string cbu;
        private string moneda;

        public Cuenta(string estado, decimal saldo, string nroCuenta, string alias, string cbu, string moneda)
        {
            this.estado = estado;
            this.saldo = saldo;
            this.nroCuenta = nroCuenta;
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

        public string NroCuenta
        {
            get { return nroCuenta; }
            set { nroCuenta = value; }
        }

        public string Alias
        {
            get { return alias; }
        }

        public string Cbu
        {
            get { return cbu; }
        }

        public string Moneda
        {
            get { return moneda; }
            set { moneda = value; }
        }
    }
}