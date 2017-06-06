//
//  Decodable.swift
//  TPGSwiftTests-iOS
//
//  Created by Yannick Heinrich on 06.06.17.
//  Copyright © 2017 yageek's company. All rights reserved.
//

import XCTest
@testable import TPGSwift

class Decodable: XCTestCase {

    static let bundle: Bundle = {
        let testBundle = Bundle(for: Decodable.self)
        let sampleURL = testBundle.url(forResource: "api_samples", withExtension: "bundle")!
        return Bundle(url: sampleURL)!
    }()

    static func getJSONSample(fileName: String) throws -> Data {
        let url = Decodable.bundle.url(forResource: fileName, withExtension: "json")!
        return try Data(contentsOf: url)
    }

    func testParsedStop() {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let data = try Decodable.getJSONSample(fileName: "GetStops")
            try decoder.decode(ParsedStopsRecord.self, from: data)
        } catch let error {
            XCTFail("Should not have failed: \(error)")
        }
    }
    
}
