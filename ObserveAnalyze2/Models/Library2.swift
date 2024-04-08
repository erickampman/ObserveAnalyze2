//
//  Library2.swift
//  ObserveAnalyze
//
//  Created by Eric Kampman on 4/8/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
class Library2 {
	var books = [Book2(author: "The Author", title: "The Title"),
				 Book2(author: "Another Author", title: "Another Title")
	]
	
}

