//
//  Book2.swift
//  ObserveAnalyze
//
//  Created by Eric Kampman on 4/8/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
class Book2: Identifiable, Equatable {
	static func == (lhs: Book2, rhs: Book2) -> Bool {
		lhs.id == rhs.id
	}
	
	var author = ""
	var title = ""
	
	var id: String {
		return String("\(title): \(author)")
	}

	
	init(author: String = "", title: String = "") {
		self.author = author
		self.title = title
	}
}
