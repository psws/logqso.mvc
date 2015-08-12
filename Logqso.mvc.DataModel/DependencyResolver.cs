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



namespace Logqso.mvc.DataModel
{
    [Export(typeof(IComponent))]
    public class DependencyResolver : IComponent
    {
        public void SetUp(IRegisterComponent registerComponent)
        {
            //regisre  DbCFpntext cuz ef lib required
            //IDataContextAsync context = new Logqso.mvc.DataModel.LogControl.LogControlDB();
            ////LogControlDB context = new Logqso.mvc.DataModel.LogControl.LogControlDB();
            //var stuff = context.CatOperator.FirstOrDefault(c => c.CatOprName == "SINGLE-OP");

            registerComponent.RegisterType<IDataContextAsync, LogControlContext>();





            var contextType = typeof(LogControlContext);
            
            //registerComponent.RegisterInstance<IDataContextAsync>(context);
             Object[] Parms = new Object[] {
             contextType
             };
             registerComponent.RegisterTypeWithInjectionTypes<IUnitOfWorkAsync, UnitOfWork>(Parms, false);


            

        }
    }

}
