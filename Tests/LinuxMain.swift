import XCTest
@testable import CSVTests
@testable import PerformanceTest
@testable import QuotedTests
@testable import TSVTests
@testable import URLTests

XCTMain([
	testCase(CSVTests.allTests),
	])
