//
//  ParsedStopsRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/**
    ParsedStopsRecord represents a set of `ParsedStop`.
 */
struct ParsedStopsRecord {

    /**
     ParsedStop represents an API object for stop.
    */
    struct ParsedStop {
        let name: String
        let code: String
        let connections: [ParsedConnection]
        let distance: Double?

        /**
         Init for JSON.
         - parameter json: Initialize from a JSON object
         */
        init?(json: [String:AnyObject]) {

            guard let stopCode = json["stopCode"] as? String, let stopName = json["stopName"] as? String else { return nil }
            name = stopName
            code = stopCode

            guard let connections = json["connections"] as? [[String:AnyObject]] else { return nil }

            var connectionsArray: [ParsedConnection] = []
            for jsonConnection in connections {
                if let  connection = ParsedConnection(json: jsonConnection) {
                    connectionsArray.append(connection)
                }

            }

            self.connections = connectionsArray

            if let dist = json["distance"] as? Double {
                distance = dist
            } else {
                distance = nil
            }
        }
    }

    let timestamp: NSDate
    let stops: [ParsedStop]

    /**
     Init for JSON.
     - parameter json: Initialize from a JSON object
     */
    init?(json: [String:AnyObject]) {

        guard let timestampValue = json["timestamp"] as? String, let stopsArray = json["stops"] as? [[String:AnyObject]] else { return nil }

        guard let date = API.TimestampFormatter.dateFromString(timestampValue) else { return nil }

        timestamp = date
        stops = stopsArray.flatMap { ParsedStop(json: $0) }

    }

}
