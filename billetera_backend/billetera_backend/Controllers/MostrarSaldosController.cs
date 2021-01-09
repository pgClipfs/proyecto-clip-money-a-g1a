using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace billetera_backend.Controllers
{

    
    public class MostrarSaldosController : ApiController
    {
        [EnableCors(origins: "*", headers: "*", methods: "*")]

        public IHttpActionResult GetCuenta(int id)
        {

            GestorCuenta gestorCuenta = new GestorCuenta();
            return Ok( gestorCuenta.ObtenerPorId(id));
        }

    }
}
