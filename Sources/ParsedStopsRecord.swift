//
//  ParsedStopsRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// ParsedStopsRecord represents a set of `ParsedStop`.
public struct ParsedStopsRecord: Decodable {
    public let timestamp: Date
    public let stops: [ParsedStop]
}

/// ParsedStop represents an API object for stop.
public struct ParsedStop: Decodable {
    public enum JSONKeys: CodingKey {
        case stopCode
        case stopName
        case connections
        case distance
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKeys.self)
        name = try container.decode(String.self, forKey: .stopName)
        code = try container.decode(String.self, forKey: .stopCode)
        connections = try container.decode([ParsedConnection].self, forKey: .connections)
        distance = try? container.decode(Double.self, forKey: .distance)
    }

    public let name: String
    public let code: String
    public let connections: [ParsedConnection]
    public let distance: Double?

}
