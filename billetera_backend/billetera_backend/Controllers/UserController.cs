using billetera_backend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace billetera_backend.Controllers
{
    public class UserController : ApiController
    {
        List<User> userList = new List<User>();

        public UserController()
        {
            userList.Add(new User { Id = 1, Nombre = "Alejandro", Apellido = "Torancio" });
        }
        public IHttpActionResult GetUsers()
        {
            return Ok(userList);
        }
    }
}
