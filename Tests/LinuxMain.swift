import XCTest
@testable import SwiftCSVTests

XCTMain([
	testCase(CSVTests.allTests),
	testCase(PerformanceTest.allTests),
	testCase(QuotedTests.allTests),
	testCase(TSVTests.allTests),
	testCase(URLTests.allTests),
	])
