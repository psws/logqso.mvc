using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Threading.Tasks;
using System.ComponentModel.Composition;
using Logqso.mvc.Resolver_MEF.Interfaces;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.domain;
using Logqso.mvc.Entities.LogControlEntity;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.DataContext;
//using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Service.Pattern;


namespace Logqso.mvc.domain
{
    [Export(typeof(IComponent))]
    public class DependencyResolver : IComponent
    {
        public void SetUp(IRegisterComponent registerComponent)
        {

            //registerComponent.RegisterType<IService<CatOperator>, Service<CatOperator> >();

            //registerComponent.RegisterType<IControlService, ControlService>();


            var RepoType = typeof(IRepositoryAsync<CatOperator>);

            Object[] Parms1 = new Object[] {
             RepoType
             };

            registerComponent.RegisterTypeWithInjectionTypes<IControlService, ControlService>(Parms1, false);

        }
    }

}
