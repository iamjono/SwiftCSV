//
//  CSV.swift
//  SwiftCSV
//
//  Created by Naoto Kaneko on 2/18/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import PerfectLib
import PerfectCURL
import cURL

public class CSV {
    static private let comma: Character = ","
    
    public var header: [String]!
    var _rows: [[String: String]]? = nil
    var _columns: [String: [String]]? = nil
    
    var text: String
    var delimiter: Character
    
    let loadColumns: Bool
    
    /// Load a CSV file from a string
    ///
    /// string: string data of the CSV file
    /// delimiter: character to split row and header fields by (default is ',')
    /// loadColumns: whether to populate the columns dictionary (default is true)
    public init(string: String, delimiter: Character = comma, loadColumns: Bool = true) {
        self.text = string
        self.delimiter = delimiter
        self.loadColumns = loadColumns
        
        let createHeader: ([String]) -> () = { head in
            self.header = head
        }
        enumerateAsArray(block: createHeader, limitTo: 1, startAt: 0)
    }
    
    /// Load a CSV file
    ///
    /// name: name of the file (will be passed to String(contentsOfFile:encoding:) to load)
    /// delimiter: character to split row and header fields by (default is ',')
    /// encoding: encoding used to read file (default is NSUTF8StringEncoding)
    /// loadColumns: whether to populate the columns dictionary (default is true)
    public convenience init(name: String, delimiter: Character = comma, encoding: String.Encoding = String.Encoding.utf8, loadColumns: Bool = true) throws {
        let contents = try String(contentsOfFile: name, encoding: encoding)
    
        self.init(string: contents, delimiter: delimiter, loadColumns: loadColumns)
    }
    
    /// Load a CSV file from a URL
    ///
    /// url: url pointing to the remote CSV to load
    /// delimiter: character to split row and header fields by (default is ',')
    /// encoding: encoding used to read file (default is NSUTF8StringEncoding)
    /// loadColumns: whether to populate the columns dictionary (default is true)
    public convenience init(url: String, delimiter: Character = comma, encoding: String.Encoding = String.Encoding.utf8, loadColumns: Bool = true) throws {
		let curlObject = CURL(url: url)
		curlObject.setOption(CURLOPT_USERAGENT, s: "PerfectAPI2.0")
		var header = [UInt8]()
		var body = [UInt8]()

		var perf = curlObject.perform()
		while perf.0 {
			if let h = perf.2 {
				header.append(contentsOf: h)
			}
			if let b = perf.3 {
				body.append(contentsOf: b)
			}
			perf = curlObject.perform()
		}
		if let h = perf.2 {
			header.append(contentsOf: h)
		}
		if let b = perf.3 {
			body.append(contentsOf: b)
		}
		let _ = perf.1

		curlObject.close()
		let contents = UTF8Encoding.encode(bytes: body)

		self.init(string: contents, delimiter: delimiter, loadColumns: loadColumns)
    }

	/// Load a CSV file from a File
	///
	/// url: url pointing to the local CSV file to load
	/// delimiter: character to split row and header fields by (default is ',')
	/// encoding: encoding used to read file (default is NSUTF8StringEncoding)
	/// loadColumns: whether to populate the columns dictionary (default is true)
	public convenience init(fileName: String, delimiter: Character = comma, encoding: String.Encoding = String.Encoding.utf8, loadColumns: Bool = true) throws {
		let thisFile = File(fileName)
		if thisFile.exists {
			try thisFile.open(.read)
			let contents = try thisFile.readString()
			self.init(string: contents, delimiter: delimiter, loadColumns: loadColumns)
		} else {
			throw PerfectError.fileError(1, "File does not exst")
		}
	}

    /// Turn the CSV data into NSData using a given encoding
    public func dataUsingEncoding(encoding: String.Encoding) -> Data? {
        return description.data(using: encoding) as Data?
    }
}
