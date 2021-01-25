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

    [RoutePrefix("api/datoscuenta")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DatosCuentaController : ApiController
    {

        //[Authorize]

        public IEnumerable<Cuenta> Get()
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.TodasLasCuentas();
        }


        public Cuenta GetCuenta(int id)
        {

            GestorCuenta gestorCuenta = new GestorCuenta();
            return ( gestorCuenta.ObtenerPorId(id));
        }

    }
}
