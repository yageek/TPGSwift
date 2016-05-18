//
//  ParsedPhysicalStopRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/**
    ParsedPhysicalStopRecord represents a set of physical stops.
 */
public struct ParsedPhysicalStopRecord {

    public struct ParsePhysicalStopInfos {
        let name: String
        let code: String
        let stops: [ParsedPhysicalStop]

        init?(json: [String:AnyObject]) {

            guard
                    let stopCode = json["stopCode"] as? String,
                    let stopName = json["stopName"] as? String,
                    let stopsArray = json["stops"] as? [[String:AnyObject]] else { return nil }

            name = stopName
            code = stopCode
            stops = stopsArray.flatMap { ParsedPhysicalStop(json: $0) }
        }
    }

    public struct ParsedPhysicalStop {

        let code: String
        let name: String

        let connections: [ParsedConnection]
        let coordinates: ParsedCoordinates

        init?(json: [String:AnyObject]) {

            guard
                    let physicalStopCode = json["physicalStopCode"] as? String,
                    let stopName = json["stopName"] as? String,
                    let coordsRaw = json["coordinates"] as? [String: AnyObject],
                    let connectsRaw = json["connections"] as? [[String:AnyObject]] else { return nil }


            guard let coords = ParsedCoordinates(json: coordsRaw) else { return nil }

            code = physicalStopCode
            name = stopName
            coordinates = coords
            connections = connectsRaw.flatMap { ParsedConnection(json: $0) }
        }
    }


    let timestamp: NSDate
    let stops: [ParsePhysicalStopInfos]

    init?(json: [String:AnyObject]) {

        guard let timestampValue = json["timestamp"] as? String, let stopsArray = json["stops"] as? [[String:AnyObject]] else { return nil }

        guard let date = API.TimestampFormatter.dateFromString(timestampValue) else { return nil }

        timestamp = date
        stops = stopsArray.flatMap { ParsePhysicalStopInfos(json: $0) }

    }

}
