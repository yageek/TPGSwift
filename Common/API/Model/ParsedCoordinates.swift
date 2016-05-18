//
//  ParsedCoordinates.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 12.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation


struct ParsedCoordinates {

    let latitude: Double
    let longitude: Double
    let referential: String

    init?(json: [String:AnyObject]) {

        guard
            let lat = json["latitude"] as? Double,
            let long = json["longitude"] as? Double,
            let ref = json["referential"] as? String else { return nil }

        latitude = lat
        longitude = long
        referential = ref
    }
}
