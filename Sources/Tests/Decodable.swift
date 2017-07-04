//
//  Decodable.swift
//  TPGSwiftTests-iOS
//
//  Created by Yannick Heinrich on 06.06.17.
//  Copyright © 2017 yageek's company. All rights reserved.
//

import XCTest
import Foundation
@testable import TPGSwift

class DecodableTests: XCTestCase {

    var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    static let bundle: Bundle = {
        let testBundle = Bundle(for: DecodableTests.self)
        let sampleURL = testBundle.url(forResource: "api_samples", withExtension: "bundle")!
        return Bundle(url: sampleURL)!
    }()

    static func getJSONSample(fileName: String) throws -> Data {
        let url = DecodableTests.bundle.url(forResource: fileName, withExtension: "json")!
        return try Data(contentsOf: url)
    }
    //public func XCTAssertEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = default, file: StaticString = #file, line: UInt = #line) where T : Equatable

    func assertDecode<Obj>(_ type: @autoclosure () -> Obj.Type, fileName: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) where Obj: Decodable {
        do {
            let data = try DecodableTests.getJSONSample(fileName: fileName())
            let _ = try jsonDecoder.decode(type(), from: data)

        } catch let error {
            XCTFail("JSON is not Equals: \(error)", file: file, line: line)
        }
    }

    func testJSON() {
        XCTAssertEqual(1, 1)
        // Stops
        assertDecode(Record<Stop>.self, fileName: "GetStops")

        // Physiscal Stops
        assertDecode(Record<PhysicalStopInfos>.self, fileName: "GetPhysicalStops")

        // Next Departures
        assertDecode(NextDepartureRecord.self, fileName: "GetNextDepartures")

    }
}
