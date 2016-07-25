//
//  ValueList.swift
//  DisplayArray
//
//  Created by Omri Gazitt on 7/25/16.
//  Copyright © 2016 Omri Gazitt. All rights reserved.
//

import Foundation

class ValueList {
    
    // document Folder URL property
    static var documentsFolderURL : NSURL {
        
        // file manager - default manager
        let URLs = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory,
                                                                   inDomains: NSSearchPathDomainMask.UserDomainMask)
        
        let documentURL = URLs[0]
        return documentURL
    }
    
    static var textFileURL : NSURL {
        return documentsFolderURL.URLByAppendingPathComponent("Array.json")
    }
    
    static var itemArray = ["Once", "Upon"]

    static var arrayAsJSON : NSData {
        do {
            let str = try NSJSONSerialization.dataWithJSONObject(itemArray, options: [])
            return str
        } catch let error {
            print("error serializing array: \(error)")
            return "".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }

    static var Values : [String] {
        // getter - read values from file and return as an array of strings
        get {
            var loadedData = NSData(contentsOfURL: textFileURL)
            
            if loadedData == nil {
                // no file - create it
                do {
                    try arrayAsJSON.writeToURL(textFileURL, options: [])
                    print("created file")
                } catch let error {
                    print("error writing file: \(error)")
                }
                loadedData = arrayAsJSON
            }

            // convert the data from json to a string array
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(loadedData!, options: [])
                itemArray = NSArray(array: jsonData as! [AnyObject]) as! [String]
            } catch let error {
                print("error deserializing json: \(error)")
            }
            
            // for debugging...
            // print("item array: \(itemArray)")
            return itemArray
        }
        
        // setter - store array of strings as JSON in the file
        set {
            self.itemArray = newValue
            do {
                try arrayAsJSON.writeToURL(textFileURL, options: [])
                // for debugging...
                // print("wrote file with itemArray \(newValue)")
            } catch let error {
                print("error writing file: \(error)")
            }
        }
    }
}