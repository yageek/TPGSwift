//
//  ParsedConnection.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/**
    ParsedConnection is a model containing the element from
    the API.
 */
public struct ParsedConnection {

    let lineCode: String
    let destinationName: String
    let destinationCode: String

    /**
        Init for JSON.
        - parameter json: Initialize from a JSON object
     */
    init?(json: [String:AnyObject]) {

        guard
            let lineCode = json["lineCode"] as? String,
            let destinationName = json["destinationName"] as? String,
            let destinationCode = json["destinationCode"] as? String
            else {
                return nil
        }

        self.lineCode = lineCode
        self.destinationName = destinationName
        self.destinationCode = destinationCode
    }

}
