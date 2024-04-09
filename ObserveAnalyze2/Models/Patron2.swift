//
//  Patron2.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/8/24.
//

import Foundation

@Observable
class Patron2: Equatable, Identifiable {
	static func == (lhs: Patron2, rhs: Patron2) -> Bool {
		lhs.id == rhs.id
	}
	
	var name: String
	var id: String {
		return name
	}
	
	init(name: String) {
		self.name = name
	}
}
