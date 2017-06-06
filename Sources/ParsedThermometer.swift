//
//  ParsedThermometer.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 17.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct ParsedThermometer: Decodable {

    public let timestamp: Date
    public let stop: ParsedStopsRecord

    public let lineCode: Double
    public let destinationName: String
    public let destinationCode: String

    public let deviations: [ParsedDeviation]
    public let disruptions: [ParsedDisruption]
}

public struct Step: Decodable {

    public let stop: ParsedStopsRecord
    public let departureCode: Double
    public let deviationCode: Double?
    public let timestamp: Date
    public let arrivalTime: Double
    public let reliability: String
    public let deviation: Bool
    public let visible: Bool
}
