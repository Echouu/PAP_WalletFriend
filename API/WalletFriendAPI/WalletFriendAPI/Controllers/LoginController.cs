using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WalletFriendAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        /// <summary>
        /// Controller for Log In
        /// </summary>
        [Route("api/[controller]")]
        [ApiController]
        [AllowAnonymous]
        public class LogInController : ControllerBase
        {
            private readonly IConfiguration _configuration;
            private IDbConnection dbConnection;

            /// <summary>
            /// Constructor
            /// </summary>
            /// <param name="configuration"></param>
            public LogInController(IConfiguration configuration)
            {
                _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
                dbConnection = new SqlConnection(configuration.GetConnectionString("OnExamDB"));
            }

            /// <summary>
            /// User Log In
            /// </summary>
            /// <param name="user"></param>
            /// <returns>NotFound or Ok</returns>
            // POST api/<LoginController>
            [HttpPost]
            public IActionResult Login([FromBody] User user)
            {
                IActionResult response = Unauthorized();
                var query = dbConnection.QueryFirstOrDefault<User>("select * from Users where Username = @Username", new { Username = user.Username });

                if (query != null)
                {
                    var pass = Encoding.UTF8.GetBytes(user.Password);
                    var salt = Convert.FromBase64String(query.Salt);

                    var passSalt = new List<byte>();
                    passSalt.AddRange(pass);
                    passSalt.AddRange(salt);

                    var sha512 = SHA512.Create();
                    var hash = sha512.ComputeHash(passSalt.ToArray());

                    if (query.Password.Equals(Convert.ToBase64String(hash)))
                    {
                        var tokenString = GenerateToken(query);
                        response = Ok(new { token = tokenString, userDetails = query });
                    }
                }

                return response;
            }

            public string GenerateToken(User user)
            {
                var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:SecretKey"]));
                var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha512);

                var claims = new[]
                {
                new Claim(ClaimTypes.Name, user.Username),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

                var token = new JwtSecurityToken(
                    issuer: _configuration["JWT: Issuer"],
                    audience: _configuration["Jwt: Audience"],
                    claims: claims,
                    expires: DateTime.Now.AddMinutes(60),
                    signingCredentials: credentials
                );

                return new JwtSecurityTokenHandler().WriteToken(token);
            }
        }
}
