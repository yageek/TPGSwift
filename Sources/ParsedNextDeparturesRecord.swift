//
//  ParsedNextDeparturesRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation


/// A set of ParsedDeparture objects.
public struct ParsedNextDeparturesRecord: Codable {

    public let timestamp: Date
    public let stop: ParsedStopsRecord.ParsedStop
    public let departures: [ParsedDeparture]

    public struct ParsedDeparture: Codable {

        public let departureCode: Double
        public let waitingTime: String
        public let waitingTimeMillis: Double
        public let connectionWaitingTime: Double?
        public let reliability: String
        public let characteristic: String?
        public let line: ParsedConnection
    }
}
