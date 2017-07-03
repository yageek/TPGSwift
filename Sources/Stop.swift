//
//  ParsedStopsRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// Stop represents an API object for stop.
public struct Stop: Decodable, APIObject {

    public static var recordName = "stops"

    public enum CodingKeys: String, CodingKey {
        case name = "stopName"
        case code = "stopCode"
        case connections
        case distance
    }

    public let name: String
    public let code: String
    public let connections: [Connection]
    public let distance: Double?
}
