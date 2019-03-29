//
//  ViewController.swift
//  OCR and Translate
//
//  Created by Peter XU on 3/25/19.
//  Copyright © 2019 Peter XU. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var capturedImageVIew: NSImageView!
    
    @IBOutlet var resultTextView: NSTextView!
    
    let scrst = SLScreenshot()
    
    @IBAction func testButtonClicked(_ sender: Any) {
        capturedImageVIew.image = scrst?.screenshotTo300dpiNSImageFromUpperLeftNoAug()
        if (capturedImageVIew!.image != nil) {
            let answer = imageToText(capturedImageVIew.image!)
            resultTextView.string = answer ?? "NONE (ERROR) (:"
        }
    }
    @IBAction func selectAreaClicked(_ sender: Any) {
//        let task = Process()
//        task.launchPath = "/usr/sbin/screencapture"
//        task.arguments = ["-i", "-c"]
//        task.launch()
//        task.waitUntilExit()
        
        scrst?.take({ (captured) in
            self.capturedImageVIew.image = captured
        })
//        let pasteboard = NSPasteboard.general
////        let read = pasteboard.pasteboardItems?.first?.types
////        print(read)
//        let readItems = pasteboard.readObjects(forClasses: [NSImage.self], options: nil)
//        if ((readItems?[0]) != nil) {
//            capturedImageVIew.image = readItems![0] as? NSImage
//        }
        
//        if (capturedImageVIew!.image != nil) {
//            let answer = imageToText(capturedImageVIew.image!)
//            resultTextView.string = answer ?? "NONE (ERROR) (:"
//        }
//        print(answer)
        
        
        
        
    }
    
}

