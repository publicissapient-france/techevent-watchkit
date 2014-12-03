//
//  PhotoDownloadManager.swift
//  XebiaSki
//
//  Created by Simone Civetta on 11/11/14.
//  Copyright (c) 2014 Xebia IT Architechts. All rights reserved.
//

import UIKit

public typealias RetrieveCallback = (UIImage?) -> ()
public typealias DownloadCallback = (NSURL?) -> ()

public class PhotoDownloadManager {
    
    private var photoURL: NSURL
    
    public init(photoURL: NSURL) {
        self.photoURL = photoURL
    }
    
    // MARK: Entry point
    
    public func retrievePhoto(callback: RetrieveCallback) {
        downloadPhoto(self.photoURL, result: {[weak self] (URL) -> () in
            if self == nil {
                callback(nil)
                return;
            }
            if let tempURL = URL? {
                self?.retrievePhotoFromLocalURL(tempURL, callback: callback)
                return;
            }
            callback(nil)
        })
    }
    
    private func retrievePhotoFromLocalURL(URL: NSURL, callback: RetrieveCallback) {
        var photo: UIImage?
        if let photoData = NSData(contentsOfURL: URL)? {
            photo = UIImage(data: photoData)
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            callback(photo)
        })
    }
    
    private func downloadPhoto(URL: NSURL, result: DownloadCallback) {
        let session = NSURLSession.sharedSession()
        session.downloadTaskWithURL(URL, completionHandler: { (localURL: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            if let HTTPResponse = response as? NSHTTPURLResponse {
                if HTTPResponse.statusCode == 200 {
                    result(localURL)
                    return;
                }
            }
            result(nil)
        }).resume()
    }
}