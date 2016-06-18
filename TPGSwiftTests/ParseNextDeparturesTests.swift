//
//  ParseNextDeparturesTests.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 19.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import XCTest
import TPGSwift

class ParseNextDeparturesTests: XCTestCase {


    func testParsing() {
        guard let object = SpecBundle.sharedInstance.json("NextDepartures") as? [String:AnyObject] else { XCTFail("Should be able to unmarshal NextDepartures") ;return }

        let nextdeparture = ParsedNextDeparturesRecord(json: object)
        XCTAssertNotNil(nextdeparture)

        XCTAssertNotNil(nextdeparture!.departures)

        XCTAssertEqual(nextdeparture!.departures.count, 6)
    }
}
