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
using Logqso.mvc.Dto.LogData;
using Repository.Pattern.Extensions.interfaces;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.Hosting;
using System.Net.Http.Headers;
using Logqso.mvc.Dto.LogControl;


namespace Logqso.WebApi
{
    [RoutePrefix("v1/Data")]
    public class DataController : ApiController
    {
        private readonly ILogService _LogService;
        private readonly ILogUnitOfWorkAsync _unitOfWorkAsync;
      
    #region Public constructor
        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>

        public DataController(
            ILogUnitOfWorkAsync unitOfWorkAsync,
            ILogService LogService)
        {
            _unitOfWorkAsync = unitOfWorkAsync;
            _LogService = LogService;
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
        [Route("GetDataCallInfoSelections")]
        public async Task<IHttpActionResult> Get()
        {
            //This webapi method loads the Callinfo selection comboboxes and sets the seleced values

            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }

            //ContestControlsDataEntity ContestControlsDataEntity = await _ControlService.GetContestControlData();
            IEnumerable<DataCallInfoDto> DataCallInfoDtos = await _LogService.GetDataCallInfoSelections(Username);
            if (DataCallInfoDtos == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(DataCallInfoDtos);
            }

        }

        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("PostCallsRequest")]
        public async Task<IHttpActionResult> PostCallsRequest(ControlCategorySettingsDto ControlCategorySettingsDto)
        {
            DataCalls DataCalls = null;
            if (DataCalls == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(DataCalls);
            }
        }

        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("PostDataCallsRequest")]
        public async Task<IHttpActionResult> PostDataCallsRequest(DataCallInfoDto DataCallInfoDto)
        {
            DataCalls DataCalls = null;
            if (DataCalls == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(DataCalls);
            }
        }


        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("CallsRequest")]
        public async Task<IHttpActionResult> CallsRequest(dataCallObjDTO dataCallObjDTO )
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }


            DataCalls DataCalls;

            DataCalls = await _LogService.GetCategorizedCallsAsync(dataCallObjDTO, Username);


            if (DataCalls == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(DataCalls);
            }

        }

        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("UpdateChart")]
        public async Task<IHttpActionResult> UpdateChartSettings(ChartCtlDataSettingsDto ChartCtlDataSettingsDto)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }
            
            MemoryStream MemoryStream = null;
            HttpResponseMessage HttpResponseMessage;
            try
            {
                _unitOfWorkAsync.BeginTransaction();

                MemoryStream = await _LogService.UpdateChartSettingsAsync(ChartCtlDataSettingsDto, Username);

                //HttpResponseMessage = new HttpResponseMessage(HttpStatusCode.OK);
                HttpResponseMessage = Request.CreateResponse(HttpStatusCode.OK);
                //String filePath = HostingEnvironment.MapPath("~/Images/HT.jpg");

                //FileStream fileStream = new FileStream(filePath, FileMode.Open);
                //Image image = System.Drawing.Image.FromStream(fileStream);
                //MemoryStream memoryStream = new MemoryStream();
                //image.Save(memoryStream, ImageFormat.Jpeg);

                //HttpResponseMessage.Content = new StreamContent(MemoryStream);

                HttpResponseMessage.Content = new ByteArrayContent(MemoryStream.ToArray());
                HttpResponseMessage.Content.Headers.ContentType = new MediaTypeHeaderValue("image/png");
                // save
                var saveChangesAsync = _unitOfWorkAsync.SaveChanges();


                _unitOfWorkAsync.Commit();
                if (MemoryStream == null )
                {
                    return NotFound();
                }
                else 
                {
                    return ResponseMessage(HttpResponseMessage);
                    //return Ok(MemoryStream);

                }
            }
            catch (Exception e)
            {
                _unitOfWorkAsync.Rollback();
                return Ok(false);

            }
        }

        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("GetUpdatedContestCall")]
        public async Task<IHttpActionResult> GetUpdatedContestCall(DataCallInfoDto DataCallInfoDto)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }


            DataCallInfoDto = await _LogService.GetUpdatedContestCall(DataCallInfoDto, Username);


            if (DataCallInfoDto == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(DataCallInfoDto);
            }

        }


        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("GetContestLogs")]
        public async Task<IHttpActionResult> GetContestLogs(LogCtlDataSettingsDto LogCtlDataSettingsDto)
        {
            string Username = Logqso.mvc.common.definitions.Username;
            bool val1 = (System.Web.HttpContext.Current != null && System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1)
            {
                Username = System.Web.HttpContext.Current.User.Identity.Name;
            }


            LogPageDTO LogPageDTO = await _LogService.GetContestLogs(LogCtlDataSettingsDto, Username);


            if (LogPageDTO == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(LogPageDTO);
            }

        }

    }
}
