using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;

namespace billetera_backend.Controllers
{
    //[Authorize]
    [RoutePrefix("api/persona")]
    public class PersonaController : ApiController
    {
        // GET: api/Persona
        public IEnumerable<Persona> Get()
        {
            GestorPersona gPersona = new GestorPersona();
            return gPersona.ObtenerPersonas();
        }

        // GET: api/Persona/5
        public Persona Get(int id)
        {
            GestorPersona gPersona = new GestorPersona();
            return gPersona.ObtenerPorId(id);
        }

        // POST: api/Persona
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Persona/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Persona/5
        public void Delete(int id)
        {
        }
    }
}
