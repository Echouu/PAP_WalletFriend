using Dapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data.SqlClient;
using WebAPIV.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPIV.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        

        // GET: api/<AuthController>/Login
        [HttpPost("login")]
        //[FromBody]
        public IActionResult Login([FromBody]UserToLogin user)
        {
            using(var conn = new SqlConnection(Strings.connectionString))
            {
                var res = conn.QueryFirstOrDefault("Select UserID, Username, Nome, Username from Utilizadores where Username=@username and Password=@password",user);
                if(res==null)
                {
                    return NotFound();
                }
                return Ok(res);
            }
        }

        // POST: api/<AuthController>/SignUp
        [HttpPost("signup")]
        public IActionResult SignUp([FromBody] UserToAuth user)
        {
            using (var conn = new SqlConnection(Strings.connectionString))
            {
                var res = conn.Execute("Insert into Utilizadores values (@Username, @Nome, @Username, @Password)", user);
                return Ok(res);
            }
        }
    }
}
