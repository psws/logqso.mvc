using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
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
using Newtonsoft.Json;
using System.Web.Http.Filters;


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


        [HttpPost]
        [ResponseType(typeof(HttpResponseMessage))]
        [Route("UploadWintestFile")]
        [ValidateMimeMultipartContent]
        public async Task<IHttpActionResult> UploadWintestFile()
        {
             //http://stackoverflow.com/questions/27885052/how-to-upload-files-to-a-web-api-server-and-send-parameters-along-to-the-action
            HttpResponseMessage HttpResponseMessage = null;

            // Put the files in a temporary location
            // this way we call ReadAsMultiPartAsync and we get access to the other data submitted
            string WintestPath = ConfigurationManager.AppSettings["WintestDirectory"].ToString();
            var tempPath = HttpContext.Current.Server.MapPath(WintestPath + @"/temp");
            if (Directory.Exists(tempPath) == false)
            {
                Directory.CreateDirectory(tempPath);
            }
            Task<bool> UpLoadTask = Task.FromResult(false);
            var streamProvider = new MultipartFormDataStreamProvider(tempPath);
            var readResult = await Request.Content.ReadAsMultipartAsync(streamProvider);

            if (readResult.FormData["UploadInfo"] == null)
            {
                // We don't have the UploadInfo ... delete the TempFiles and return BadRequest
                File.Delete(tempPath);
                HttpResponseMessage =  Request.CreateResponse(HttpStatusCode.BadRequest,"The file upload has failed");
            }
            else
            {//process formdata


                // The files have been successfully saved in a TempLocation and the FileModels are not null
                // Validate that everything else is fine with this command
                //var DataCallInfoDto = JsonConvert.DeserializeObject<IEnumerable<DataCallInfoDto>>(readResult.FormData["UploadInfo"]).ToList();
                var DataCallInfoDto = JsonConvert.DeserializeObject<DataCallInfoDto>(readResult.FormData["UploadInfo"]);
                bool result;
                var FileData = readResult.FileData.FirstOrDefault();
                string UploadFile = FileData.LocalFileName;
                //foreach (var tempFile in readResult.FileData)
                //{
                var originalFileName = FileData.Headers.ContentDisposition.FileName.Replace("\"", string.Empty);

                //check if 1st 2 qsos match DB.
                result  =  await _LogService.ValiadateWintestStnUpload(DataCallInfoDto, originalFileName, UploadFile);
                //}
                if (result == true)
                {
                    HttpResponseMessage = Request.CreateResponse(HttpStatusCode.OK, "The file upload has completed");
                    //move file
                    var StorePath = HttpContext.Current.Server.MapPath(WintestPath + @"/" + DataCallInfoDto.SelectedContestName);
                    if (Directory.Exists(StorePath) == false)
                    {
                        Directory.CreateDirectory(StorePath);
                    }
                    var SavePath = StorePath + @"/" + DataCallInfoDto.SelectedCall + ".CSV";
                    if (File.Exists(SavePath) )
                    {
                        File.Delete(SavePath);
                    }
                    Directory.Move(UploadFile, SavePath);

                    File.Delete(UploadFile);

                    //start background thread, same proces so we need to wait. 
                    // or the _BackgroundLogService will be disposed since it is owned  by the data Controller
                    //var Taskupload = _BackgroundLogService.ProcessWintestStnUpload(DataCallInfoDto.LogId, SavePath).ConfigureAwait(false);
                    //await Taskupload;
                    UpLoadTask = _LogService.ProcessWintestStnUpload(DataCallInfoDto.LogId, SavePath);

                }
                else
                {
                    HttpResponseMessage = Request.CreateResponse(HttpStatusCode.BadRequest, 
                        "The Uploaded file does not match the submitted log. The file upload has failed");
                }
            }



 //           var httpPostedFile = HttpContext.Current.Request.Files["UploadedFile"];
 //           if (httpPostedFile != null)
 //           {
 //               // Validate the uploaded image(optional)

 //               // Get the complete file path
 //               var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/UploadedFiles"), httpPostedFile.FileName);

 //               // Save the uploaded file to "UploadedFiles" folder
 //               //                        httpPostedFile.SaveAs(fileSavePath);

 ////               return new KeyValuePair<bool, string>(true, "File uploaded successfully.");
 //           }


            //System.Web.HttpFileCollection hfc = System.Web.HttpContext.Current.Request.Files;
            //foreach (System.Web.HttpPostedFile hpf in hfc)
            //{
            //    //System.Web.HttpPostedFileBase hpf = file as System.Web.HttpPostedFileBase;
            //    if (hpf.ContentLength == 0)
            //        continue;
            //    string savedFileName = Path.Combine(
            //        AppDomain.CurrentDomain.BaseDirectory,
            //        Path.GetFileName(hpf.FileName));
            //    hpf.SaveAs(savedFileName);
            //}
            if (HttpResponseMessage == null)
            {
                return NotFound();
            }
            else
            {
                await UpLoadTask;
                return ResponseMessage(HttpResponseMessage);
                //return Ok(HttpResponseMessage);
                //return Ok();
            }
        }

        public class ValidateMimeMultipartContent : ActionFilterAttribute
        {
            public override void OnActionExecuting(System.Web.Http.Controllers.HttpActionContext actionContext)
            {
                if (!actionContext.Request.Content.IsMimeMultipartContent())
                {
                    actionContext.Response = actionContext.Request.CreateErrorResponse(HttpStatusCode.UnsupportedMediaType, "Unsupported Media Type");
                }
            }
        }

    }
}
