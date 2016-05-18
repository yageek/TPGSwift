//
//  ParsedNextDeparturesRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct ParsedNextDeparturesRecord {

    let timestamp: NSDate
    let stop: [ParsedStopsRecord.ParsedStop]

    public struct ParsedDeparture {

        let departureCode: Double
        let waitingTime: Double
        let waitingTimeMillis: Double

        let connectionWaitingTime: Double?

        let connection: ParsedConnection

        let reliability: String
        let characteristic: String


        init?(json: [String:AnyObject]) {


            guard
                let code = json["departureCode"] as? Double,
                let waitingT = json["waintingTime"] as? Double,
                let waitingTMS = json["waitingTimeMillis"] as? Double,
                let connectionRaw = json["connection"] as? [String:AnyObject],
                let rel = json["reliability"] as? String,
                let ch = json[""] as? String else { return nil }


            guard let connectionUnserialized = ParsedConnection(json: connectionRaw) else { return nil }

            departureCode = code
            waitingTime = waitingT
            waitingTimeMillis = waitingTMS
            reliability = rel
            characteristic = ch
            connection = connectionUnserialized

            connectionWaitingTime = json["connectionWaitingTime"] as? Double

        }

    }


}
