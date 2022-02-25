using Dapper;
using Dapper.Contrib.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using WalletFriendAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace WalletFriendAPI.Controllers
{
    /// <summary>
    /// User Sign Up
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class SignUpController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        private IDbConnection dbConnection;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="configuration"></param>
        public SignUpController(IConfiguration configuration)
        {
            _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
            dbConnection = new SqlConnection(configuration.GetConnectionString("OnExamDB"));
        }

        /// <summary>
        /// User Sign Up
        /// </summary>
        /// <param name="user"></param>
        /// <returns>Conflict or Success</returns>
        // POST api/<SignUpController>
        [HttpPost]
        public IActionResult SignUp([FromBody] User user)
        {
            if (dbConnection.ExecuteScalar<int>("select count(*) from Users where Username=@Username or Email=@Email", new { Username = user.Username, Email = user.Email }) > 0)
            {
                ModelState.AddModelError("Erro!", "Username e email já existem!");
                return Conflict(ModelState);
            }
            else if (dbConnection.ExecuteScalar<int>("select count(*) from Users where Username=@Username", new { Username = user.Username }) > 0)
            {
                ModelState.AddModelError("Erro!", "Username já existe!");
                return Conflict(ModelState);
            }
            else if (dbConnection.ExecuteScalar<int>("select count(*) from Users where Email=@Email", new { Email = user.Email }) > 0)
            {
                ModelState.AddModelError("Erro!", "Email já existe!");
                return Conflict(ModelState);
            }

            var salt = new byte[16];
            var pass = Encoding.UTF8.GetBytes(user.Password);
            new RNGCryptoServiceProvider().GetBytes(salt);

            var passSalt = new List<byte>();
            passSalt.AddRange(pass);
            passSalt.AddRange(salt);

            var sha512 = SHA512.Create();
            var hash = sha512.ComputeHash(passSalt.ToArray());

            var id = dbConnection.Insert(new User
            {
                Name = user.Name,
                Email = user.Email,
                Username = user.Username,
                Password = Convert.ToBase64String(hash),
                Salt = Convert.ToBase64String(salt)
            });

            if (id == 0)
            {
                ModelState.AddModelError("Erro!", "Problema ao registar!");
                return Conflict(ModelState);
            }

            return StatusCode(201);
        }
    }
}
