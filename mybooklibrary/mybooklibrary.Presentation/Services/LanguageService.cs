using System.Reflection;
using Microsoft.Extensions.Localization;

namespace mybooklibrary.Presentation.Services{
    public class LanguageService{
        private readonly IStringLocalizer _localizer;

        public class SharedResource(){

        }

        public LanguageService(IStringLocalizerFactory factory){
            var type = typeof(SharedResource);
            var assemblyName = new AssemblyName(type.GetTypeInfo().Assembly.FullName);
            _localizer = factory.Create(nameof(SharedResource), assemblyName.Name);
            
            // _localizer = localizer;
        }

        public LocalizedString GetKey(string key){
            return _localizer[key];
        }
    }
}