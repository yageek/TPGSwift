//
//  ParsedPhysicalStopRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// ParsedPhysicalStopRecord represents a set of physical stops.
public struct ParsedPhysicalStopRecord: Codable {

    public struct ParsePhysicalStopInfos: Codable {
        public let name: String
        public let code: String
        public let stops: [ParsedPhysicalStop]
    }

    public struct ParsedPhysicalStop: Codable {

        public let code: String
        public let name: String

        public let connections: [ParsedConnection]
        public let coordinates: ParsedCoordinates
    }


    public let timestamp: Date
    public let stops: [ParsePhysicalStopInfos]
}
