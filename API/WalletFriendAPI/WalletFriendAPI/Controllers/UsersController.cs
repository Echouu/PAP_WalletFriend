using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using WalletFriendAPI.Interfaces;
using WalletFriendAPI.Services;
using WalletFriendAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WalletFriendAPI.Controllers
{
    /// <summary>
    /// Controller for Users entities
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private IOnExamService _onExamService;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="configuration"></param>
        public UsersController(IConfiguration configuration, IEnumerable<IOnExamService> onExamServices)
        {
            _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
            _onExamService = onExamServices.SingleOrDefault(p => p.GetType().Name == typeof(OnExamServiceClass).Name);
            _onExamService.DbConnection = new SqlConnection(configuration.GetConnectionString("WalletFriend"));
        }

        /// <summary>
        /// Get Users entity
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Users entity</returns>
        // GET: api/<UsersController>/5
        [HttpGet("{id}")]
        public User Get(long id)
        {
            return WalletFriend.Get<User>(id);
        }

        /// <summary>
        /// Update Users entity
        /// </summary>
        /// <param name="user"></param>
        /// <returns>Success or Conflict</returns>
        // PUT api/<UsersController>
        [HttpPut]
        public IActionResult Put([FromBody] User user)
        {
            if (_onExamService.Put(user))
                return StatusCode(201);
            else
            {
                ModelState.AddModelError("Erro!", "Erro ao atualizar!");
                return Conflict(ModelState);
            }
        }

        /// <summary>
        /// Delete Users entity
        /// </summary>
        /// <param name="user"></param>
        /// <returns>Success or Conflict</returns>
        // DELETE api/<UsersController>
        [HttpDelete]
        public IActionResult Delete([FromBody] User user)
        {
            if (_onExamService.Delete(user))
                return StatusCode(201);
            else
            {
                ModelState.AddModelError("Erro!", "Erro ao eliminar!");
                return Conflict(ModelState);
            }
        }
    }
}
