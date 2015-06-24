using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Logqso.mvc.ui.Startup))]
namespace Logqso.mvc.ui
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
