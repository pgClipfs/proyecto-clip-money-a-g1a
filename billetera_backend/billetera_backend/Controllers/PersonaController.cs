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
    
    [RoutePrefix("api/persona")]
        [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class PersonaController : ApiController
    {
        

        // POST: api/Persona
        [Authorize]
        public Persona Post(Persona persona)
        {
            int id;
            GestorPersona gPersona = new GestorPersona();
            id = gPersona.AgregarPersona(persona);
            persona.Id = id;
            return persona;
        }

        /*public Persona Post(Persona persona, LoginRequest usuario)
        {
            int id;
            int id_usuario;
            GestorPersona gPersona = new GestorPersona();
            GestorLogin gLogin = new GestorLogin();
            id = gPersona.AgregarPersona(persona);
            persona.Id = id;
            usuario.Id_persona = persona.Id;
            id_usuario = gLogin.AgregarUsuario(usuario);
            usuario.Id = id_usuario;
            return persona;
        }*/

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
