using System;
using System.Linq;
using AutoMapper;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Logqso.mvc.domain.test.UnitTests.Automap
{
    [TestClass]
    public class AutomapTest
    {
        [TestMethod]
        public void CallInfo_MapsToDataCallInfoDto_ConfigurationIsValid()
        {
            AutoMapper.IMappingExpression<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto> MapperCallInfoDatToCallInfoDto = null;
            AutoMapper.IMappingExpression<Logqso.mvc.Entities.LogDataEntity.Log, Logqso.mvc.Dto.LogData.DataCallInfoDto> MapperLogDatToCallInfoDto = null;
            //Arrange
            MapperCallInfoDatToCallInfoDto = AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                 ForMember(m => m.SelectedContestName, c => c.MapFrom(s => s.ContestId));
            //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
               MapperCallInfoDatToCallInfoDto.ForMember(m => m.SelectedCall, c => c.MapFrom(s => s.CallSign.Call));
            //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.SelectedStationName, c => c.MapFrom(s => s.StationName));
            //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.StationNames, c => c.Ignore());
                //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.ContestNames, c => c.Ignore());

                //MapperLogDatToCallInfoDto =  AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.Log, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                //   ForMember(m => m.ContestNames, c => c.MapFrom(s => s.Contest));
                //    MapperLogDatToCallInfoDto.ForMember(m => m.StationNames, c => c.MapFrom(s => s.Stations));

                //    MapperLogDatToCallInfoDto.ForMember(m => m.SelectedCall, c => c.Ignore() );
                //    MapperLogDatToCallInfoDto.ForMember(m => m.SelectedContestName, c => c.Ignore() );
                //    MapperLogDatToCallInfoDto.ForMember(m => m.SelectedStationName, c => c.Ignore());
                //    MapperLogDatToCallInfoDto.ForMember(m => m.CallGroup, c => c.Ignore());
                //    MapperLogDatToCallInfoDto.ForMember(m => m.Disabled, c => c.Ignore());
           
            //Act
 
            //Assert
            Mapper.AssertConfigurationIsValid();


        }


    }
}
