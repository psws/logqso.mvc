using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Threading.Tasks;
using System.ComponentModel.Composition;
using Logqso.mvc.Resolver_MEF.Interfaces;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.DataContext;
using Repository.Pattern.Repositories;
using Repository.Pattern.Ef6;
using Logqso.mvc.Entities.LogControlEntity;
using Logqso.mvc.DataModel.LogControl.Models;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.DataModel.LogData.Models;
using Repository.Pattern.Extensions.interfaces;
using Logqso.mvc.DataModel;
using Logqso.Repository.Repository;




namespace Logqso.Repository
{
    [Export(typeof(IComponent))]
    public class DependencyResolver : IComponent
    {
        public void SetUp(IRegisterComponent registerComponent)
        {
 #if true
            //registerComponent.RegisterType<IDataContextAsync, LogqsoDataContext>();

           // registerComponent.RegisterType<IUnitOfWorkAsync, UnitOfWork>();
            //registerComponent.RegisterType<IRepositoryAsync<CatOperator>, Repository<CatOperator>>();

            registerComponent.RegisterType<ILogqsoControlContext, LogControlContext>();
            registerComponent.RegisterType<IControlUnitOfWorkAsync, ControlUnitOfWork>();
            registerComponent.RegisterType<IRepositoryAsync<CatOperator>, ResposituryControl<CatOperator>>();


#else
           //regisre  DbCFpntext cuz ef lib required
            //LogControlDB context = new Logqso.mvc.DataModel.LogControl.LogControlDB();

            var contextType = typeof(LogControlContext);

            //registerComponent.RegisterInstance<LogControlDB>(context);

#if true
            //MOVED FROM UI LATER
            //var contextType = typeof(LogControlContext);

            //registerComponent.RegisterInstance<IDataContextAsync>(context);
            Object[] Parms = new Object[] {
             contextType
             };
            registerComponent.RegisterTypeWithInjectionTypes<IUnitOfWorkAsync, UnitOfWork>(Parms, false);
#endif

            var uowType = typeof(IUnitOfWorkAsync);
                        registerComponent.RegisterType<IDataContextAsync, LogControlContext>();

            Object[] Parms2 = new Object[] {
             contextType,
             uowType
             };
            registerComponent.RegisterTypeWithInjectionTypes<IRepositoryAsync<CatOperator>, Repository<CatOperator>>(Parms2, false);
#endif

            //LOGQSOSATA
#if true
            //registerComponent.RegisterType<IDataContextAsync, LogqsoDataContext>();

            //registerComponent.RegisterType<IUnitOfWorkAsync, UnitOfWork>();
            //registerComponent.RegisterType<IRepositoryAsync<Log>, Repository<Log>>();
            //support for multiple DB
            registerComponent.RegisterType<ILogqsoDataContext, LogqsoDataContext>();
            registerComponent.RegisterType<ILogUnitOfWorkAsync, LogUnitOfWork>();
            registerComponent.RegisterType<IRepositoryAsync<Log>, ResposituryLog<Log>>();
            


#else
            var contextTypeData = typeof(LogqsoDataContext);
            //registerComponent.RegisterType<IDataContextAsync, LogqsoDataContext>();
            //contextTypeData = typeof(IDataContextAsync);

            Object[] ParmsData = new Object[] {
             contextTypeData
             };
            registerComponent.RegisterTypeWithInjectionTypes<IUnitOfWorkDataAsync, UnitOfWorkData>(ParmsData, false);
            //registerComponent.RegisterTypeWithInjectionTypes<IUnitOfWorkAsync, UnitOfWork>(ParmsData, false);

            var uowTypeData = typeof(IUnitOfWorkDataAsync);

            Object[] ParmsData2 = new Object[] {
             contextTypeData,
             uowTypeData
             };
            registerComponent.RegisterTypeWithInjectionTypes<IRepositoryAsync<Log>, Repository<Log>>(ParmsData2, false);
#endif
            //IUnitOfWorkAsync UowObj = new UnitOfWork(context);
            //IRepositoryAsync<CatOperator> Repo = new Repository<CatOperator>(context, UowObj);
            //registerComponent.RegisterInstance<IRepositoryAsync<CatOperator>>(Repo);



            //var RepoType = typeof(IRepositoryAsync<CatOperator>);

            //Object[] Parms1 = new Object[] {
            // RepoType
            // };

            //registerComponent.RegisterTypeWithInjectionTypes<IControlService, ControlService>(Parms1, false);



        }
    }

}
