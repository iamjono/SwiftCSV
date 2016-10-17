//
//  URLTests.swift
//  SwiftCSV
//
//  Created by Will Richardson on 8/04/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import XCTest
@testable import SwiftCSV

class URLTests: XCTestCase {
    var csv: CSV!

	static var allTests : [(String, (URLTests) -> () throws -> ())] {
		return [
			("testEmptyFieldsURL", testEmptyFieldsURL),
			("testEmptyFieldsFile", testEmptyFieldsFile),
			("testQuotes", testQuotes)
		]
	}



	func testEmptyFieldsURL() {
		let csvURL = "https://raw.githubusercontent.com/iamjono/SwiftCSV/master/Tests/SwiftCSVTests/empty_fields.csv"
		csv = try! CSV(url: csvURL)
		let expected = [
			["id": "1", "name": "John", "age": "23"],
			["id": "2", "name": "James", "age": "32"],
			["id": "3", "name": "", "age": ""],
			["id": "6", "name": "", "age": ""],
			["id": "", "name": "", "age": ""],
			["id": "", "name": "Tom", "age": ""]
		]
		for (index, row) in csv.rows.enumerated() {
			XCTAssertEqual(expected[index], row)
		}
	}

	func testEmptyFieldsFile() {
		let csvFile = "Tests/SwiftCSVTests/empty_fields.csv" // NEEDS TO BE RUN IN TERMINAL
		csv = try! CSV(fileName: csvFile)
		let expected = [
			["id": "1", "name": "John", "age": "23"],
			["id": "2", "name": "James", "age": "32"],
			["id": "3", "name": "", "age": ""],
			["id": "6", "name": "", "age": ""],
			["id": "", "name": "", "age": ""],
			["id": "", "name": "Tom", "age": ""]
		]
		for (index, row) in csv.rows.enumerated() {
			XCTAssertEqual(expected[index], row)
		}
	}

    func testQuotes() {
		let csvFile = "Tests/SwiftCSVTests/quotes.csv" // NEEDS TO BE RUN IN TERMINAL
		csv = try! CSV(fileName: csvFile)
        let expected = [
            ["id": "4", "name, first": "Alex", "name, last": "Smith"],
            ["id": "5", "name, first": "Joe", "name, last": "Bloggs"],
            [
                "id": "9",
                "name, first": "Person, with a \"quote\" in their name",
                "name, last": "uugh"
            ],
            [
                "id": "10",
                "name, first": "Person, with escaped comma",
                "name, last": "Jones"
            ],
            [
                "id": "10",
                "name, first": "Person\\ with a backslash",
                "name, last": "Jones"
            ],
            [
                "id": "12",
                "name, first": "Newlines\nare the best",
                "name, last": "Woo hoo"
            ],
            [:]
        ]
        for (index, row) in csv.rows.enumerated() {
            XCTAssertEqual(expected[index], row)
        }
    }

}
