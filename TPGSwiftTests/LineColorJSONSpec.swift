//
//  LineColorJSONSpec.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 17.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Quick
import Nimble
@testable import TPGSwift

class LineColorJSONSpec: QuickSpec {
    override func spec() {
        describe("The LineColor JSON specification") {

            guard let object = SpecBundle.sharedInstance.json("LinesColor") as? [String:AnyObject] else { XCTFail("Should be able to unmarshal LineColors") ;return }



            it("should unserialize correctly the provided JSON") {

                let record = ParsedLineColorRecord(json: object)
                expect(record).toNot(beNil())
                expect(record!.lineColors.count).to(equal(4))


                let firstLine = record!.lineColors[0]

                expect(firstLine.lineCode).to(equal("1"))
                expect(firstLine.hexa).to(equal("5a1e82"))
                expect(firstLine.background).to(equal("5a1e82"))
                expect(firstLine.text).to(equal("ffffff"))

            }
        }
    }
}

