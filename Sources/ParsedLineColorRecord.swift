//
//  ParsedLineColorRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// ParsedLineColorRecord represents a set of `ParsedLineColor` objects.
public struct ParsedLineColorRecord: Codable {

    public let timestamp: Date

    public let lineColors: [ParsedLineColor]
}

/// ParsedLineColor represents an API line color object.
public struct ParsedLineColor: Codable {

    public let hexa: String
    public let lineCode: String
    public let background: String
    public let text: String
}
