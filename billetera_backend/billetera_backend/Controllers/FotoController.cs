using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace billetera_backend.Controllers
{
    [RoutePrefix("api/foto")]
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]

    public class FotoController : ApiController
    {
        // GET: api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/values
        public void Post([FromBody] string value)
        {
        }

    }
}
