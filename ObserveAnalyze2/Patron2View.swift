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
		VStack {
			Text(patron.id)
				.font(.title)
			Text("Books Checked Out")
				.font(.title3)
				.underline()
		}
		ForEach( library.booksCheckedOutByPatron(patron.id)) { book in
			Text(book.id)
		}
    }
}

#Preview {
	let library = Library2()
	@State var patron = Patron2(name: "Todd Rundgren")

    return Patron2View(patron: patron)
		.environment(library)
}
