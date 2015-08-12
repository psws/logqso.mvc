using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Results;
using System.Threading.Tasks;
using Logqso.mvc.domain.Interfaces;
using Repository.Pattern.UnitOfWork;
using Logqso.Repository.Repository.Models;

namespace Logqso.mvc.ui.Controllers.WebApi
{
    public class ControlController : ApiController
    {
        private readonly IControlService _ControlService;
        private readonly IUnitOfWorkAsync _unitOfWorkAsync;
      
    #region Public constructor
        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>

        public ControlController(
            IUnitOfWorkAsync unitOfWorkAsync,
            IControlService ControlService)
        {
            _unitOfWorkAsync = unitOfWorkAsync;
            _ControlService = ControlService;
        }

    #endregion
        // GET: api/Controls
        //public IEnumerable<string> Get()
        //{
        //    _ControlService.GetContestControls();
        //    return new string[] { "value1", "value2" };
        //}
                    //This Works
        //public HttpResponseMessage Get()
        //{
        //    ContestControlEntity ContestControlEntity = _ControlService.GetContestControls();
        //    // in your case this will be result of some service method and then
        //    if (ContestControlEntity == null)
        //        return Request.CreateResponse(HttpStatusCode.NotFound);

        //    return Request.CreateResponse(HttpStatusCode.OK, ContestControlEntity);
        //}

                            //This Works-- ASync example. nothing requires async
        [ResponseType(typeof(HttpResponseMessage))]
        public async Task<IHttpActionResult> Get()
        {
            ContestControlEntity ContestControlEntity = await _ControlService.GetContestControls();
            // in your case this will be result of some service method and then
            if (ContestControlEntity == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(ContestControlEntity);
            }

        }

        //public async Task<int> doWork()
        //{
        //    int control =  await GetContestControlEntitAsync();
        //    return control;
        //}

        //public  Task<int> GetContestControlEntitAsync()
        //{
        //    int val =  5;
            
        //    return Task.FromResult(val);

        //}

        // GET: api/Controls/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Controls
        public void Post([FromBody]string value)
        {

                try
                {
                    _unitOfWorkAsync.BeginTransaction();

                    //_ControlService.Insert(new ContestControlEntity { CustomerID = "YODA", CompanyName = "SkyRanch", ObjectState = ObjectState.Added });
                    //_ControlService.Insert(new ContestControlEntity { CustomerID = "JEDI", CompanyName = "SkyRanch", ObjectState = ObjectState.Added });


                    // save
                    var saveChangesAsync = _unitOfWorkAsync.SaveChanges();


                    _unitOfWorkAsync.Commit();
                }
                catch (Exception e)
                {
                    _unitOfWorkAsync.Rollback();
                }
        }

        // PUT: api/Controls/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Controls/5
        public void Delete(int id)
        {
        }
    }
}
