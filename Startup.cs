using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web2._0Assignment.Startup))]
namespace Web2._0Assignment
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
