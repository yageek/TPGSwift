//
//  API.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

/**
    API is the enum used to called the different endpoints.
 */
public enum API {

    // MARK: Stops

    case GetStops(stopCode: String?, stopName: String?, line: String?, latitude: Float?, longitude: Float?)
    case GetPhysicalStops(stopCode: String?, stopName: String?)

    // MARK: Departures
    case GetNextDepartures(stopCode:String, departureCode:String?, linesCode:String?, destinationsCode:String?)
    case GetAllNextDepartures(stopCode:String, linesCode:String, destinationsCode:String)

    // MARK: Thermometers
    case GetThermometer(departureCode: String)
    case GetThermometerPhysicalStops(departureCode: String)

    // MARK: LineColors
    case GetLinesColors

    // MARK: Disruptions
    case GetDisruptions
}

public protocol JSONMarshable {
    init?(json: [String:Any])
}
