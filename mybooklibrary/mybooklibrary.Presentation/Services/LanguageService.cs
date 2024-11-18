using System.Reflection;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;

namespace mybooklibrary.Presentation.Services{
    public class LanguageService{
        private readonly IStringLocalizer _localizer;
        private readonly string _filePath = Path.Combine(Directory.GetCurrentDirectory(), "Resources", "localization.json");
        private Dictionary<string, Dictionary<string, string>> _localizationData;

        public class SharedResource(){

        }

        public LanguageService()
        {
            // JSON dosyasını oku ve veriyi deseralize et
            var json = File.ReadAllText(_filePath);
            _localizationData = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, string>>>(json);
        }

        // public LocalizedString GetKey(string key){
        //     return _localizer[key];
        // }

        public string GetKey(string key, string culture)
        {
        if (_localizationData.ContainsKey(key))
        {
            if (_localizationData[key].ContainsKey(culture))
            {
                return _localizationData[key][culture];
            }
            else
            {
                Console.WriteLine("Culture not found for key: " + key);
            }
        }
        else
        {
            Console.WriteLine("Key not found: " + key);
        }
        return key;
        }
    }
}