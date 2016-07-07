//
//  ParsedNextDeparturesRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct ParsedNextDeparturesRecord: JSONMarshable {

    public let timestamp: NSDate
    public let stop: ParsedStopsRecord.ParsedStop
    public let departures: [ParsedDeparture]

    public struct ParsedDeparture: JSONMarshable {

        public let departureCode: Double
        public let waitingTime: String
        public let waitingTimeMillis: Double
        public let connectionWaitingTime: Double?
        public let reliability: String
        public let characteristic: String?
        public let line: ParsedConnection

        public init?(json: [String:AnyObject]) {

            guard
                let codeJSON = json["departureCode"] as? Double,
                let waitingTimeJSON = json["waitingTime"] as? String,
                let waitingTimemillisJSON = json["waitingTimeMillis"] as? Double,
                let lineJSON = json["line"] as? [String:AnyObject],
                let reliabilityJSON = json["reliability"] as? String else { return nil }


            guard let lineDecoded = ParsedConnection(json: lineJSON) else { return nil }

            departureCode = codeJSON
            waitingTime = waitingTimeJSON
            waitingTimeMillis = waitingTimemillisJSON
            reliability = reliabilityJSON
            characteristic = json["characteristics"] as? String
            connectionWaitingTime = json["connectionWaitingTime"] as? Double
            line = lineDecoded

        }

    }


    public init?(json: [String : AnyObject]) {

        guard
            let dateRaw = json["timestamp"] as? String,
            let stopRaw = json["stop"] as? [String: AnyObject],
            let departuresRaw = json["departures"] as? [[String:AnyObject]] else { return nil }

        guard let date = API.TimestampFormatter.dateFromString(dateRaw) else { return nil }

        guard let stopV = ParsedStopsRecord.ParsedStop(json: stopRaw) else { return nil }

        timestamp = date
        stop = stopV
        departures = departuresRaw.flatMap { ParsedDeparture(json: $0) }
    }


}
