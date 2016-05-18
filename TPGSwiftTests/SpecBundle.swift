//
//  SpecBundle.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 17.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation


public class SpecBundle {

   let JSONSpecBundle: NSBundle

    static let sharedInstance: SpecBundle = {
        return SpecBundle()
    }()

   private init () {
        let bundle = NSBundle(forClass: self.dynamicType)

        let bundleURL = bundle.URLForResource("SPEC", withExtension: "bundle")!
        JSONSpecBundle = NSBundle(URL: bundleURL)!
    }

    public func json(name: String) -> AnyObject {

        let json = JSONSpecBundle.URLForResource(name, withExtension: "json")

        let data = NSData(contentsOfURL: json!)!
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data, options: [])
            return object

        } catch let error{
            fatalError("Error: \(error)")
        }


    }

}