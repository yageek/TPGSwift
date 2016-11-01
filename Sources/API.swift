//
//  API.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation


/// API is the enum used to called the different endpoints.
///
/// - GetStops: Get all Stops.
/// - GetPhysicalStops: Get all physical stops.
/// - GetNextDepartures: Get next departures.
/// - GetAllNextDepartures: Get all the next departures.
/// - GetThermometer: Get the thermometer.
/// - GetThermometerPhysicalStops: Get the thermometer for physical stops.
/// - GetLinesColors: Get the color for the lines.
/// - GetDisruptions: Get the disruptions.
public enum API {

    //MARK: Stops
    case GetStops(stopCode: String?, stopName: String?, line: String?, latitude: Float?, longitude: Float?)
    case GetPhysicalStops(stopCode: String?, stopName: String?)

    //MARK: Departures
    case GetNextDepartures(stopCode:String, departureCode:String?, linesCode:String?, destinationsCode:String?)
    case GetAllNextDepartures(stopCode:String, linesCode:String, destinationsCode:String)

    //MARK: Thermometers
    case GetThermometer(departureCode: String)
    case GetThermometerPhysicalStops(departureCode: String)

    //MARK: LineColors
    case GetLinesColors

    //MARK: Disruptions
    case GetDisruptions
}


/// JSONMarshable represents an item
/// that can be convertible to JSON.
public protocol JSONMarshable {
    init?(json: [String:AnyObject])
}
