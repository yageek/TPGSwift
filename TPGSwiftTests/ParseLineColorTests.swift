//
//  ParseLineColorTests.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 19.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import XCTest
import TPGSwift

class ParseLineColorTests: XCTestCase {

    func testParseLineColor() {

        guard let object = SpecBundle.sharedInstance.json("LinesColor") as? [String:AnyObject] else { XCTFail("Should be able to unmarshal LineColors") ;return }


        let record = ParsedLineColorRecord(json: object)
        XCTAssertNotNil(record)
        XCTAssertEqual(record!.lineColors.count, 4)

        let firstLine = record!.lineColors[0]

        XCTAssertEqual(firstLine.lineCode,"1")
        XCTAssertEqual(firstLine.hexa,"5a1e82")
        XCTAssertEqual(firstLine.background,"5a1e82")
        XCTAssertEqual(firstLine.text,"ffffff")
    }


}
