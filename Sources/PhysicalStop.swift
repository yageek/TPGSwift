//
//  ParsedPhysicalStop.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct PhysicalStopInfos: Decodable, APIObject {
    public static var recordName = "stops"
    public let name: String
    public let code: String
    public let stops: [PhysicalStop]

    public enum CodingKeys: String, CodingKey {
        case name = "stopName"
        case code = "stopCode"
        case stops = "physicalStops"
    }

    public struct PhysicalStop: Decodable {

        public let code: String
        public let name: String

        public let connections: [Connection]
        public let coordinates: Coordinates

        public enum CodingKeys: String, CodingKey {
            case name = "stopName"
            case code = "physicalStopCode"

            case connections
            case coordinates
        }
    }
}
