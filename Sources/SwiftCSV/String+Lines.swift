//
//  String+Lines.swift
//  SwiftCSV
//
//  Created by Naoto Kaneko on 2/24/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

extension String {
    var firstLine: String {
		let endIndex = lastLineSeparator(in: self)
		return String(self[startIndex..<endIndex])
    }
	private func lastLineSeparator(in unis: String) -> String.Index {
		let startIndex = unis.startIndex
		var endIndex = unis.endIndex
		let seperators = [Character("\r\n"),Character("\n"),Character("\r")]
		while endIndex != startIndex {
			if !seperators.contains(unis[unis.index(before: endIndex)]) {
				break
			}
			endIndex = unis.index(before: endIndex)
		}
		return endIndex
	}
	
}

