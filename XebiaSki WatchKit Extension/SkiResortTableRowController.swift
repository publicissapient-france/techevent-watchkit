//
//  SkiResortTableRowController.swift
//  XebiaSki
//
//  Created by Simone Civetta on 28/11/14.
//  Copyright (c) 2014 Xebia IT Architechts. All rights reserved.
//

import WatchKit
import XebiaSkiFramework

class SkiResortTableRowController: NSObject {
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    
    func configureWithSkiResort(webcam: SkiResort) {
        self.titleLabel.setText(webcam.name)
    }
}