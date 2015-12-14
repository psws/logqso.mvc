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



namespace Logqso.Repository
{
    [Export(typeof(IComponent))]
    public class DependencyResolver : IComponent
    {
        public void SetUp(IRegisterComponent registerComponent)
        {
            //regisre  DbCFpntext cuz ef lib required
            //LogControlDB context = new Logqso.mvc.DataModel.LogControl.LogControlDB();

            var contextType = typeof(LogControlContext);

            //registerComponent.RegisterInstance<LogControlDB>(context);

            var uowType = typeof(IUnitOfWorkAsync);

            Object[] Parms2 = new Object[] {
             contextType,
             uowType
             };
            registerComponent.RegisterTypeWithInjectionTypes<IRepositoryAsync<CatOperator>, Repository<CatOperator>>(Parms2, false);


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
