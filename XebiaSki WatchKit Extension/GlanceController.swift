//
//  GlanceController.swift
//  XebiaSki WatchKit Extension
//
//  Created by Simone Civetta on 19/11/14.
//  Copyright (c) 2014 Xebia IT Architechts. All rights reserved.
//

import WatchKit
import Foundation
import XebiaSkiFramework

class GlanceController: WKInterfaceController {

    @IBOutlet weak var mainGroup: WKInterfaceGroup!
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    
    private var photoDownloadManager: PhotoDownloadManager?
    
    var selectedSkiResort: SkiResort? {
        get {
            if let data = NSUserDefaults.standardUserDefaults().valueForKey("selection")? as? NSData {
                return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? SkiResort
            }
            return nil
        }
    }
    
    override init(context: AnyObject?) {
        super.init(context: context)
    }

    override func willActivate() {
        super.willActivate()
        
        if let skiResort = self.selectedSkiResort? {
            self.photoDownloadManager = PhotoDownloadManager(photoURL: skiResort.photoURL)
            self.photoDownloadManager?.retrievePhoto({ [weak self] (image) -> () in
                if let weakSelf = self? {
                    weakSelf.mainGroup.setBackgroundImage(image)
                }
            })
            self.titleLabel.setText(skiResort.name)
        } else {
            self.mainGroup.setBackgroundImage(nil)
            self.titleLabel.setText("")
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

}
