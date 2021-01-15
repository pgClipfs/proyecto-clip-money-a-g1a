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
    
    public class UltimosMovController : ApiController
    {
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IEnumerable<Operacion> GetOperaciones(int id)
        {
            GestorOperaciones gestor = new GestorOperaciones();
            return  gestor.ObtenerPorId(id);
        }
    }
}
