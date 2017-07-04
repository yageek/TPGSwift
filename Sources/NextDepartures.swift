//
//  NextDepartures.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct NextDepartureRecord: Decodable {
    public let timestamp: Date
    public let stop: Stop
    public let departures: [NextDeparture]

    public struct NextDeparture: Decodable {

        public let code: Int
        public let waitingTime: String
        public let waitingTimeMillis: TimeInterval
        public let connectionWaitingTime: TimeInterval?
        public let reliability: String
        public let line: Connection
        public let characteristics: String?
        public let vehiculeNo: Int?
        public let vehiculeType: String?
        public let disruptions: [Disruption]?

        public enum CodingKeys: String, CodingKey {
            case code = "departureCode"
            case waitingTime
            case waitingTimeMillis
            case connectionWaitingTime
            case reliability
            case line
            case characteristics
            case vehiculeNo
            case vehiculeType
            case disruptions
        }
    }
}
