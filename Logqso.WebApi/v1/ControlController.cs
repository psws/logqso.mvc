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
using Logqso.Repository.Models;
using Logqso.Repository.Models.LogControl;

namespace Logqso.WebApi
{
    [RoutePrefix("v1/Control")]
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
        //    _ControlService.GetContestControlNames();
        //    return new string[] { "value1", "value2" };
        //}
                    //This Works
        //public HttpResponseMessage Get()
        //{
        //    ContestControlEntity ContestControlEntity = _ControlService.GetContestControlNames();
        //    // in your case this will be result of some service method and then
        //    if (ContestControlEntity == null)
        //        return Request.CreateResponse(HttpStatusCode.NotFound);

        //    return Request.CreateResponse(HttpStatusCode.OK, ContestControlEntity);
        //}

                            //This Works-- ASync example. nothing requires async
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("")]
        [Route("GetControlNames")]
        public async Task<IHttpActionResult> Get()
        {
            //ContestControlsDataEntity ContestControlsDataEntity = await _ControlService.GetContestControlData();
            ContestControlEntity ContestControlEntity = await _ControlService.GetContestControlNames();
            if (ContestControlEntity == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(ContestControlEntity);
                //return Ok(ContestControlEntity);
            }

        }

        [ResponseType(typeof(HttpResponseMessage))]
        [Route("GetControlSelections")]
        public async Task<IHttpActionResult> GetControlSelections()
        {
            string Username = Logqso.mvc.common.definitions.Username;

            bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;   
            }
            ContestControlSettingsEntity ContestControlSettingsEntity = await _ControlService.GetControlSelections(Username);
            if (ContestControlSettingsEntity == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(ContestControlSettingsEntity);
                //return Ok(ContestControlEntity);
            }

        }


        //one selection group
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("GetControlSelection/{Selection}")]
        public async Task<IHttpActionResult> GetControlSelection(string Selection)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }

            object valueObj = null;
            switch (Selection)
            {
                case "ControlCategorySettingsEntity":
                    valueObj = await _ControlService.GetControlSelection<ControlCategorySettingsEntity>(Username);
                    break;
                case "ControlFiltersSettingsEntity":
                    valueObj = await _ControlService.GetControlSelection<ControlFiltersSettingsEntity>(Username);
                    break;
                case "ControlXaxisSettingsEntity":
                    valueObj = await _ControlService.GetControlSelection<ControlXaxisSettingsEntity>(Username);
                    break;
                case "ControlYaxisSettingsEntity":
                    valueObj = await _ControlService.GetControlSelection<ControlYaxisSettingsEntity>(Username);
                    break;
                default:
                    break;
            }

            if (valueObj == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(valueObj);
            }


        }



        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("SendControlSelections")]
        public async Task<IHttpActionResult> SendControlSelections(ContestControlSettingsEntity ContestControlSettingsEntity)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }
            bool bSaved = await _ControlService.SaveControlSelections(ContestControlSettingsEntity, Username);
            if (ContestControlSettingsEntity == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(bSaved);
                //return Ok(ContestControlEntity);
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
        //[Route("{id:int}")]
        //[Route("GetaBook/{id:int}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Controls
        //[Route("")]
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
        //[Route("{id:int}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Controls/5
        public void Delete(int id)
        {
        }
    }
}
