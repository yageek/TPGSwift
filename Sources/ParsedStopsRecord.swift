//
//  ParsedStopsRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// ParsedStopsRecord represents a set of `ParsedStop`.
public struct ParsedStopsRecord: Codable {

    /// ParsedStop represents an API object for stop.
    public struct ParsedStop: Codable {

        public let name: String
        public let code: String
        public let connections: [ParsedConnection]
        public let distance: Double?
    }

    public let timestamp: Date
    public let stops: [ParsedStop]

}
