//
//  APIURLSerialization.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

extension API {

    private static let StopCodeParameter = "stopCode"
    private static let StopNameParameter = "stopName"
    private static let LineParameter = "line"
    private static let LinesCodeParameter = "linesCode"
    private static let LongitudeParameter = "longitude"
    private static let LatitudeParameter = "latitude"
    private static let DepartureCodeParameter = "departudeCode"
    private static let DestinationsCodeParameter = "destinationsCode"


    /**
     The `NSURL` requests corresponding to the current enum value.
    */
    public var URL: NSURL {

        guard let Key = API.Key else { fatalError("API KEY has to been set.") }

        let result:(path: String, parameters: [String:AnyObject?]?) = {
            switch self {

            case .GetStops(let stopCode, let stopName, let line, let longitude, let latitude):
                return ("GetStops", [API.StopCodeParameter : stopCode, API.StopNameParameter: stopName, API.LineParameter: line, API.LongitudeParameter: longitude, API.LatitudeParameter: latitude])
            case GetPhysicalStops(let stopCode, let stopName):
                return ("GetPhysicalStops", [API.StopCodeParameter  : stopCode, API.StopNameParameter : stopName])
            case GetNextDepartures(let stopCode, let departureCode, let linesCode, let destinationsCode):
                return ("GetNextDepartures", [API.StopCodeParameter  : stopCode, API.DepartureCodeParameter: departureCode, API.LinesCodeParameter: linesCode, API.DestinationsCodeParameter: destinationsCode])
            case GetAllNextDepartures(let stopCode, let linesCode, let destinationsCode):
                return ("GetNextDepartures", [API.StopCodeParameter  : stopCode, API.LinesCodeParameter: linesCode, API.DestinationsCodeParameter: destinationsCode])
            case GetThermometer(let departureCode):
                return ("GetThermometer", [API.DepartureCodeParameter : departureCode])
            case GetThermometerPhysicalStops(let departureCode):
                return ("GetThermometerPhysicalStops", [API.DepartureCodeParameter  : departureCode])
            case GetLinesColors:
                return ("GetLinesColors", nil)
            case GetDisruptions:
                return ("GetDisruptions", nil)
            }
        }()

        var parameters = ["key": Key] as [String:AnyObject]

        if let additionalParameters = result.parameters {
            for (key, value) in additionalParameters where value != nil {
                parameters[key] = value!
            }
        }

        let pathURL = API.HostURL.URLByAppendingPathComponent(result.path).URLByAppendingPathExtension("json")
        let components = NSURLComponents(URL: pathURL, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters.map({ (key, value) -> NSURLQueryItem in
            return NSURLQueryItem(name: key, value: String(value))
        })

        let url = components?.URL
        return url!
    }
}
