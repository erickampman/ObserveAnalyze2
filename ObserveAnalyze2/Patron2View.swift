//
//  Patron2View.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/10/24.
//

import SwiftUI

struct Patron2View: View {
	@Environment(Library2.self) private var library
	var patron: Patron2
	
    var body: some View {
		ForEach(booksCheckedOut(patron)) { book in
			Text(book.id)
		}
    }
	
	func booksCheckedOut(_ patron: Patron2) -> [Book2] {
		let books = library.books.filter { book in
			book.patronID == patron.id
		}
		
		return books
	}
}

#Preview {
	let library = Library2()
	@State var patron = Patron2(name: "Todd Rundgren")

    return Patron2View(patron: patron)
		.environment(library)
}
