using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;
using System.Web.Http.Cors;

namespace billetera_backend.Controllers
{
    //[Authorize]
    [RoutePrefix("api/persona")]
    public class PersonaController : ApiController
    {
        // GET: api/Persona
        [EnableCors(origins: "*", headers: "*", methods: "*")]
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
        public Persona Post(Persona persona)
        {
            int id;
            GestorPersona gPersona = new GestorPersona();
            id = gPersona.AgregarPersona(persona);
            persona.Id = id;
            return persona;
        }

        // PUT: api/Persona/5
        public void Put(Persona persona)
        {
            GestorPersona gPersona = new GestorPersona();
            gPersona.ModificarPersona(persona);

        }

        // DELETE: api/Persona/5
        public void Delete(int id)
        {
            GestorPersona gPersona = new GestorPersona();
            gPersona.Eliminar(id);

        }
    }
}
