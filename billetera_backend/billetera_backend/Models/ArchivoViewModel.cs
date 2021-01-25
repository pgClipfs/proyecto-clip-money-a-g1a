using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class ArchivoViewModel
    {
       
        public HttpPostedFileBase Archivo1 { get; set; }
        
        
        public HttpPostedFileBase Archivo2 { get; set; }
        
        public string Cadena { get; set; }

    }
}