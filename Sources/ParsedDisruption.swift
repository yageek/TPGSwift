//
//  ParsedDisruption.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// An API Object representing the disruption.
public struct ParsedDisruption: Codable {

    public let code: String
    public let timestamp: Date
    public let place: String
    public let nature: String
    public let consequence: String
    public let stopName: String
}
