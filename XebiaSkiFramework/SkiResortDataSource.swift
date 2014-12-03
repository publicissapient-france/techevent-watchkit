//
//  SkiResortDataSource.swift
//  XebiaSki
//
//  Created by Simone Civetta on 02/12/14.
//  Copyright (c) 2014 Xebia IT Architechts. All rights reserved.
//

public class SkiResortDataSource {
    var allObjects: Array<SkiResort>
    
    public init() {
        self.allObjects = [
            SkiResort(name: "Arcabulle", photoURL: NSURL(string: "http://www.trinum.com/ibox/ftpcam/les-arcs_arcabulle.jpg")!, temperature: 5),
            SkiResort(name: "Arcs 1600 Pistes", photoURL: NSURL(string: "http://static1.lesarcsnet.com/image_uploader/webcam/large/lesarcs-1600-cam.jpg")!, temperature: -2),
            SkiResort(name: "Vanoise Express", photoURL: NSURL(string: "http://trinum.com/ibox/ftpcam/Peisey-Vallandry_vanoise-expresse.jpg")!, temperature: 4),
            SkiResort(name: "Arc 1950 Village", photoURL: NSURL(string: "http://www.trinum.com/ibox/ftpcam/arc-1950-haut-village.jpg")!, temperature: 0)
        ]
    }
    
    public var count: Int {
        get {
            return self.allObjects.count
        }
    }
    
    public subscript(index: Int) -> SkiResort {
        return self.allObjects[index]
    }
}