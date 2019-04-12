//
//  NetworkReqTranslate.swift
//  OCR and Translate
//
//  Created by Peter XU on 4/5/19.
//  Copyright © 2019 Peter XU. All rights reserved.
//

let TranslateServices = [YandexTranslate.self, SwiftGoogleTranslate.self]

public class BaseTranslate {
    public class var shared: BaseTranslate {
        return BaseTranslate()
    }
    
    public func start(with apiKey: String) {
        
    }
    public func translate(_ q: String, _ target: String, _ source: String, _ format: String = "text", _ model: String = "base", _ completion: @escaping ((_ text: String?, _ error: Error?) -> Void)) {
    }
    
}
