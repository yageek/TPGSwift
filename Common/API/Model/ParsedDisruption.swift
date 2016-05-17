//
//  ParsedDisruption.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct ParsedDisruption {

    let code: String
    let timestamp: NSDate
    let place: String
    let nature: String
    let consequence: String
    let stopName: String

    init?(json: [String:AnyObject]) {

        guard
                let disruptionCode = json["disruptionCode"] as? String,
                let date = json["timestamp"] as? String,
                let natureValue = json["nature"] as? String,
                let consequenceValue = json["consequence"] as? String,
                let placeValue = json["place"] as? String,
                let name = json["stopName"] as? String else { return nil }

        guard let timestampValue = API.TimestampFormatter.dateFromString(date) else { return nil }

        code = disruptionCode
        timestamp = timestampValue
        place = placeValue
        nature = natureValue
        consequence = consequenceValue
        stopName = name

    }

}
