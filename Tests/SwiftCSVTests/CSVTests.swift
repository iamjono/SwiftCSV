//
//  CSVTests.swift
//  CSVTests
//
//  Created by naoty on 2014/06/09.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import XCTest
@testable import SwiftCSV

class CSVTests: XCTestCase {
    var csv: CSV!
    
    override func setUp() {
        csv = CSV(string: "id,name,age\n1,Alice,18\n2,Bob,19\n3,Charlie,20")
    }


	static var allTests : [(String, (CSVTests) -> () throws -> ())] {
		return [
			("testInit_makesHeader", testInit_makesHeader),
			("testDescription", testDescription)
		]
	}



    func testInit_makesHeader() {
        XCTAssertEqual(csv.header, ["id", "name", "age"])
    }
    
//    func testInit_makesRows() {
//        XCTAssertEqual(csv.rows, [
//            ["id": "1", "name": "Alice", "age": "18"],
//            ["id": "2", "name": "Bob", "age": "19"],
//            ["id": "3", "name": "Charlie", "age": "20"]
//			])
//    }
//    
//    func testInit_whenThereAreIncompleteRows_makesRows() {
//        csv = CSV(string: "id,name,age\n1,Alice,18\n2,Bob,19\n3,Charlie")
//        XCTAssertEqual(csv.rows, [
//            ["id": "1", "name": "Alice", "age": "18"],
//            ["id": "2", "name": "Bob", "age": "19"],
//            ["id": "3", "name": "Charlie", "age": ""]
//        ])
//    }
//    
//    func testInit_whenThereAreCRLFs_makesRows() {
//        csv = CSV(string: "id,name,age\r\n1,Alice,18\r\n2,Bob,19\r\n3,Charlie,20\r\n")
//        XCTAssertEqual(csv.rows, [
//            ["id": "1", "name": "Alice", "age": "18"],
//            ["id": "2", "name": "Bob", "age": "19"],
//            ["id": "3", "name": "Charlie", "age": "20"]
//        ])
//    }
//    
//    func testInit_makesColumns() {
//        XCTAssertEqual(csv.columns, [
//            "id": ["1", "2", "3"],
//            "name": ["Alice", "Bob", "Charlie"],
//            "age": ["18", "19", "20"]
//        ])
//    }

    func testDescription() {
        XCTAssertEqual(csv.description, "id,name,age\n1,Alice,18\n2,Bob,19\n3,Charlie,20")
    }

//    func testIgnoreColumns() {
//        csv = CSV(string: "id,name,age\n1,Alice,18\n2,Bob,19\n3,Charlie,20", delimiter: ",", loadColumns: false)
//        XCTAssertEqual(csv.columns.isEmpty, true)
//        XCTAssertEqual(csv.rows, [
//            ["id": "1", "name": "Alice", "age": "18"],
//            ["id": "2", "name": "Bob", "age": "19"],
//            ["id": "3", "name": "Charlie", "age": "20"]
//        ])
//    }
}
