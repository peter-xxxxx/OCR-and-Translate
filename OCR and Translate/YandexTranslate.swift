import Foundation

public class YandexTranslate: BaseTranslate {
    /// Shared instance.
    public override class var shared: YandexTranslate {
        return YandexTranslate()
    }
    
    private var Apikey: String!
    
    public override func start (with key: String) {
        self.Apikey = key
    }
    
    private struct YandexAPI {
        static let transBase = "https://translate.yandex.net/api/v1.5/tr.json/translate"
        
    }
    
    public override func translate (_ q: String, _ target: String, _ source: String, _ format: String = "text", _ model: String = "base", _ completion: @escaping ((_ text: String?, _ error: Error?) -> Void))  {
        
        let urlstring = YandexAPI.transBase+"?key="+Apikey+"&text="+(q.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")+"&lang="+target
        
        let url = URL(string: urlstring)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
                
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any] {
                
                if dictionary["code"] as? Int == 200 {
                    if let t = dictionary["text"] {
                        completion((t as! [String])[0], nil)
                        
                    }
                    else {
                        completion(nil, error)
                        
                    }
                }
                else {
                    completion(nil, error)
                    
                }
                
            }
            else {
                completion(nil, error)
                
            }
            
        }
        task.resume()
    }
}
