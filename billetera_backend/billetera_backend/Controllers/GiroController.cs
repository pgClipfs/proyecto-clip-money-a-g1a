using billetera_backend.Models;
using billetera_project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace billetera_backend.Controllers
{

    [RoutePrefix("api/giro")]
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class GiroController : ApiController
    {

        public Giro Post(Giro giro)
        {
            int id;
            GestorCuenta gestor = new GestorCuenta();
            id = gestor.HacerGiro(giro);
            giro.Id = id;
            return giro;
        }


        public IHttpActionResult Get()
        {

            return Ok("Funciona");
        }

    }
}
