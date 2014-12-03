//
//  SkiResort.swift
//  XebiaSki
//
//  Created by JC on 30/11/14.
//  Copyright (c) 2014 Xebia IT Architechts. All rights reserved.
//

public class SkiResort: NSObject, NSCoding {
    public var name: String
    public var photoURL: NSURL
    public var temperature: Int
    
    public init(name: String, photoURL: NSURL, temperature: Int) {
        self.name = name
        self.photoURL = photoURL
        self.temperature = temperature
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as String
        self.photoURL = NSURL(string: aDecoder.decodeObjectForKey("photoURL") as String)!
        self.temperature = aDecoder.decodeObjectForKey("temperature") as Int
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.photoURL.absoluteString, forKey: "photoURL")
        aCoder.encodeObject(self.temperature, forKey: "temperature")
    }
}