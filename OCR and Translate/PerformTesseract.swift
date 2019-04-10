//
//  PerformTessaract.swift
//  OCR and Translate
//
//  Created by Peter XU on 3/26/19.
//  Copyright © 2019 Peter XU. All rights reserved.
//

import Foundation
import AppKit

public class PerformTesseract {
    public class func imageToText(_ image: NSImage) -> String? {
        let ocr = SLTesseract()
        ocr.language = "eng+jpn+chi_sim"
        //ocr.charWhitelist = @"1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
        //ocr.charWhitelist = @"1234567890";
        //ocr.charBlacklist = @"1234567890";
        let text = ocr.recognize(image)
        return text
    }
    
}
