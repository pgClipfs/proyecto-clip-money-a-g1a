using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace billetera_backend.Models
{
    public class ArchivoViewModel
    {
        [Required]
        //[DisplayName("Mi archivo")]
        public HttpPostedFileBase Archivo1 { get; set; }
        [Required]
        //[DisplayName("Mi archivo2")]
        public HttpPostedFileBase Archivo2 { get; set; }
        [Required]
        //[DisplayName("Mi cadena")]
        public string Cadena { get; set; }
    }
}