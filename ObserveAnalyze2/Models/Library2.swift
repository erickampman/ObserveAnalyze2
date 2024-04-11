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
	
	var patrons = [Patron2(name: "Todd Rundgren"),
				   Patron2(name: "Kevin Gilbert")
	]
	
	func bookFromID(_ id: Book2.ID) -> Book2? {
		return self.books.first { book in
			book.id == id
		}
	}
	
	func patronFromID(_ id: Patron2.ID) -> Patron2? {
		return self.patrons.first { patron in
			patron.id == id
		}
	}

	/*
		In the real world this would be the wrong way to
		go about it, given how likely the set of all books
		in a library there would be.
		
		A reasonable solution might be to track a patron's
		set of checked out books in the patron itself.
	 
		FIXME
	 */
	func booksCheckedOutByPatron(_ id: Patron2.ID) -> [Book2] {
		var ret = [Book2]()
		
		for book in books {
			if book.patronID == id {
				ret.append(book)
			}
		}
		return ret
	}
	
	func checkedOutTo(_ book: Book2) -> Patron2.ID? {
		guard let id = book.patronID else {
			return nil
		}
		guard let patron = self.patronFromID(id) else {
			return nil // probably an error
		}
		return patron.id
	}
	
	func checkedOutDescription(_ book: Book2) -> String {
		guard let id = checkedOutTo(book) else {
			return "<<Available>>"
		}
		guard let patron = self.patronFromID(id) else {
			return "<<Available>>"	// actually an error FIXME
		}
		return patron.id
	}

}

