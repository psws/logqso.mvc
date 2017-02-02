using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using Logqso.mvc.domain.Interfaces;

using System.Threading.Tasks;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Repository;
using Repository.Pattern.Repositories;
using Repository.Pattern.DataContext;
using Repository.Pattern.UnitOfWork;
using Logqso.mvc.DataModel.LogData.Models;

namespace Logqso.mvc.domain
{
    class ProcessStations
    {
        public string UpLoadedFile {get; set;}
        public int LogId { get; set; }
        //IRepositoryAsync<Log> _LogRepository { get; set; }
        private readonly IRepositoryAsync<Log> _LogRepository;

        public ProcessStations( IRepositoryAsync<Log> LogRepository)
        {
            this._LogRepository = LogRepository;
            //this.LogId = LogId;
            //this.UpLoadedFile = UpLoadedFile;
        }

        public async Task<bool> StationsToDatabase()
        {
            bool results = true;   
            StreamReader TxtStream = new StreamReader(UpLoadedFile);
            List<string> Stations = new List<string>();
            if (TxtStream != null)
            {
                using (TxtStream)
                {
                    List<string> rowcolumns = TxtStream.ReadLine().Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).ToList();
                    int columnStation = rowcolumns.FindIndex(x => x == "Station name");
                    if (columnStation >= 0)
                    {
                        // QSO number
                        int columnQsoNo = rowcolumns.FindIndex(x => x == "QSO number");
                        int columnFreq = rowcolumns.FindIndex(x => x == "Frequency (kHz)");
                        QsoUpdateStationNamesDTOCollection QsoUpdateStationNamesDTOCollection = new QsoUpdateStationNamesDTOCollection();

                        while (TxtStream.Peek() >= 0)
                        {
                            string station;

                            string QsoLine = TxtStream.ReadLine();
                            if (QsoLine.Contains("\"") == true)
                            {//filter out euro m decimal point
                                var first = QsoLine.IndexOf('"');
                                var last = QsoLine.LastIndexOf('"');
                                char[] arraychar = QsoLine.ToArray();
                                for (int i = first; i < last; i++)
                                {
                                    if (arraychar[i] == ',')
                                    {
                                        arraychar[i] = '.';
                                    }
                                }
                                arraychar[first] = ',';
                                arraychar[last] = ',';
                                QsoLine = new string(arraychar);
                            }
                            rowcolumns = QsoLine.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).ToList();
                            station = rowcolumns[columnStation];
                            if (station.Length > 20)  //max length
                            {
                                station = station.Substring(0, 20);
                            }
                            if (Stations.Contains(station) == false)
                            {
                                Stations.Add(station);
                            }
                            QsoUpdateStationNamesDTO QsoUpdateStationNamesDTO = new QsoUpdateStationNamesDTO
                            {
                                LogId = LogId,
                                QsoNo = short.Parse(rowcolumns[columnQsoNo]),
                                StationName = station,
                                Frequency = decimal.Parse(rowcolumns[columnFreq])
                            };
                            QsoUpdateStationNamesDTOCollection.Add(QsoUpdateStationNamesDTO);
                        }
                        if (Stations.Count != 0)
                        {//store Stations
                            List<Station> LogStations = new List<Station>();
                            foreach (var item in Stations)
                            {
                                Station LogStation = new Station
                                {
                                    LogId = LogId,
                                    StationName = item,
                                };
                                LogStations.Add(LogStation);
                            }
                            //add to db
                            await _LogRepository.SetStationList(LogId, LogStations);
                        }
                        if (QsoUpdateStationNamesDTOCollection.Count != 0)
                        {
                            await _LogRepository.UpdateQsoStationsAsync(QsoUpdateStationNamesDTOCollection);

                        }
                    }
                }
            }
            else
            {
                results = false;
            }
            return results;
        }

    }
}
