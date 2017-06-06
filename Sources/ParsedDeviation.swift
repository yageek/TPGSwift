//
//  ParsedDeviation.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/// An API Object representing deviation.
public struct ParsedDeviation: Decodable {

    /// The code of the deviation.
    public let code: Double

    /// The starting stop of the deviation.
    public let startStop: ParsedStopsRecord.ParsedStop?

    /// The ending stop of the deviation.
    public let endStop: ParsedStopsRecord.ParsedStop?
}
