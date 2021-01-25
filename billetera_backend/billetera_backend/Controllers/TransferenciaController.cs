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

    [RoutePrefix("api/transferencia")]
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class TransferenciaController : ApiController
    {

  

        public Transferencia Post(Transferencia transferencia)
        {
            int id;
            GestorCuenta gestor = new GestorCuenta();
            id = gestor.HacerTransferencia(transferencia);
            transferencia.Id = id;
            return transferencia;
        }


        public IHttpActionResult Get()
        {

            return Ok("Funciona");
        }
    }
}
