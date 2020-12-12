using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace billetera_backend.Controllers
{
    
    public class MostrarSaldosController : ApiController
    {
        
        public IHttpActionResult GetCuenta(int id)
        {

            GestorCuenta gestorCuenta = new GestorCuenta();
            return Ok( gestorCuenta.ObtenerPorId(id));
        }

    }
}
