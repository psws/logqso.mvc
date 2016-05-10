using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Logqso.mvc.ui.Startup))]
namespace Logqso.mvc.ui
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
#if CONTESTQSO1n1DEBUG
            //no support on 1n1
            ConfigureAuth(app);

#else
            ConfigureAuth(app);
#endif
        }
    }
}
