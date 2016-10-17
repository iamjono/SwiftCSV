//
//  PerformanceTest.swift
//  SwiftCSV
//
//  Created by 杉本裕樹 on 2016/04/23.
//  Copyright © 2016年 Naoto Kaneko. All rights reserved.
//

import XCTest
@testable import SwiftCSV

class PerformanceTest: XCTestCase {
    var csv: CSV!

    override func setUp() {
		let csvFile = "Tests/SwiftCSVTests/large.csv" // NEEDS TO BE RUN IN TERMINAL
		csv = try! CSV(fileName: csvFile)
    }

	static var allTests : [(String, (PerformanceTest) -> () throws -> ())] {
		return [
			("testParsePerformance", testParsePerformance)
		]
	}


    func testParsePerformance() {
        measure {
            let _ = self.csv.rows
        }
    }
}
