//
//  InterfaceController.swift
//  XebiaSki WatchKit Extension
//
//  Created by Simone Civetta on 03/12/14.
//  Copyright (c) 2014 Xebia IT Architechts. All rights reserved.
//

import WatchKit
import Foundation
import XebiaSkiFramework


class InterfaceController: WKInterfaceController {

    private var dataSource = SkiResortDataSource()
    @IBOutlet weak var mainTable: WKInterfaceTable!
    
    override init(context: AnyObject?) {
        super.init(context: context)
        
        reloadTableData()
    }
    
    func reloadTableData() {
        mainTable.setNumberOfRows(self.dataSource.count, withRowType: "SkiResortTableRow")
        for var index = 0; index < self.dataSource.count; ++index {
            let row = mainTable.rowControllerAtIndex(index) as SkiResortTableRowController
            row.configureWithSkiResort(self.dataSource[index])
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

}
