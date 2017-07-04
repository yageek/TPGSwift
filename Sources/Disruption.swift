//
//  ParsedDisruption.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct Disruption: Decodable {
    public let code: Int
    public let timestamp: Date
    public let place: String
    public let nature: String
    public let consequence: String

    public enum CodingKeys: String, CodingKey {
        case code = "disruptionCode"
        case timestamp
        case place
        case nature
        case consequence
    }
}
