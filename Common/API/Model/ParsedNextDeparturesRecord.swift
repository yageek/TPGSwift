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
        public let waitingTime: Double
        public let waitingTimeMillis: Double

        public let connectionWaitingTime: Double?

        public let reliability: String
        public let characteristic: String

        public init?(json: [String:AnyObject]) {

            guard
                let code = json["departureCode"] as? Double,
                let waitingT = json["waintingTime"] as? Double,
                let waitingTMS = json["waitingTimeMillis"] as? Double,
                let rel = json["reliability"] as? String,
                let ch = json["characteristics"] as? String else { return nil }


            departureCode = code
            waitingTime = waitingT
            waitingTimeMillis = waitingTMS
            reliability = rel
            characteristic = ch

            connectionWaitingTime = json["connectionWaitingTime"] as? Double

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
