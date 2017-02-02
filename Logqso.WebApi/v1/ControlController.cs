using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Results;
using System.Threading.Tasks;
using System.Diagnostics;
using Logqso.mvc.domain.Interfaces;
using Repository.Pattern.UnitOfWork;
using Logqso.mvc.Dto.LogControl;
using Repository.Pattern.Extensions.interfaces;

namespace Logqso.WebApi
{
    [RoutePrefix("v1/Control")]
    public class ControlController : ApiController
    {
        private readonly IControlService _ControlService;
        private readonly IControlUnitOfWorkAsync _unitOfWorkAsync;
      
    #region Public constructor
        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>

        public ControlController(
            IControlUnitOfWorkAsync unitOfWorkAsync,
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
            ContestControlDto ContestControlDto = await _ControlService.GetContestControlNames();
            if (ContestControlDto == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(ContestControlDto);
                //return Ok(ContestControlEntity);
            }

        }

        [ResponseType(typeof(HttpResponseMessage))]
        [Route("GetControlSelections")]
        public async Task<IHttpActionResult> GetControlSelections()
        {
            string Username = Logqso.mvc.common.definitions.Username;

            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;   
            }
            ContestControlSettingsDto ContestControlSettingsDto = await _ControlService.GetControlSelections(Username);
            if (ContestControlSettingsDto == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(ContestControlSettingsDto);
                //return Ok(ContestControlEntity);
            }

        }


        //one selection group
        [HttpGet]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("GetControlSelection/{Selection}")]
        public async Task<IHttpActionResult> GetControlSelection(string Selection)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }

            object valueObj = null;
            switch (Selection)
            {
                case "ControlCategorySettingsDto":
                    valueObj = await _ControlService.GetControlSelection<ControlCategorySettingsDto>(Username);
                    break;
                case "ControlFiltersSettingsDto":
                    valueObj = await _ControlService.GetControlSelection<ControlFiltersSettingsDto>(Username);
                    break;
                case "ControlXaxisSettingsDto":
                    valueObj = await _ControlService.GetControlSelection<ControlXaxisSettingsDto>(Username);
                    break;
                case "ControlYaxisSettingsDto":
                    valueObj = await _ControlService.GetControlSelection<ControlYaxisSettingsDto>(Username);
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
        public async Task<IHttpActionResult> SendControlSelections(ContestControlSettingsDto ContestControlSettingsDto)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }
            try
            {
                _unitOfWorkAsync.BeginTransaction();

                bool bSaved = await _ControlService.SaveControlSelections(ContestControlSettingsDto, Username);


                // save
                var saveChangesAsync = _unitOfWorkAsync.SaveChanges();


                _unitOfWorkAsync.Commit();
                if (ContestControlSettingsDto == null)
                {
                    return NotFound();
                }
                else
                {
                    return Ok(bSaved);
                    //return Ok(ContestControlEntity);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(string.Format("SendControlSelections() exception {0}", ex.Message)); 
                _unitOfWorkAsync.Rollback();
                return Ok(false);

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

                    //_ControlService.Insert(new ContestControlDto { CustomerID = "YODA", CompanyName = "SkyRanch", ObjectState = ObjectState.Added });
                    //_ControlService.Insert(new ContestControlDto { CustomerID = "JEDI", CompanyName = "SkyRanch", ObjectState = ObjectState.Added });


                    // save
                    var saveChangesAsync = _unitOfWorkAsync.SaveChanges();


                    _unitOfWorkAsync.Commit();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(string.Format("Post() exception {0}", ex.Message));
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
