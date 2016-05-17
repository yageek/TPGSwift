//
//  ParsedDeviation.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public struct ParsedDeviation {

    let code: Double
    let startStop: ParsedStopsRecord.ParsedStop?
    let endStop: ParsedStopsRecord.ParsedStop?

    init?(json: [String:AnyObject]) {

        guard let deviationCode = json["deviationCode"] as? Double else { return nil }

        code = deviationCode

        if let start = json["startStop"] as? [String:AnyObject], let end = json["endStop"] as? [String:AnyObject] {
            startStop = ParsedStopsRecord.ParsedStop(json: start)
            endStop = ParsedStopsRecord.ParsedStop(json: end)
        } else {
            startStop = nil
            endStop = nil
        }
    }
}
