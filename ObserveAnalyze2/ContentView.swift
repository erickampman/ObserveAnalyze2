//
//  ContentView.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/8/24.
//

import SwiftUI

struct ContentView: View {
	@Environment(Library2.self) private var library
	@State private var showingAddBook = false
	@State private var showingEditBook = false
	@State private var showingAddPatron = false
	@State private var showingCheckout = false
	@State private var title = ""
	@State private var author = ""
	@State private var bookSelection: Book2.ID?

	var body: some View {
		VStack {
			NavigationStack {
				List(library.books, selection: $bookSelection) { book in
					Text(book.id)
				}
			}
		}
		.padding()
		.toolbar {
			HStack {
				Button("Add Book") {
					showingAddBook.toggle()
				}
				Button("Edit Book") {
					showingEditBook.toggle()
				}
				.disabled(bookSelection == nil)
				Text("•")
				Button("Add Patron") {
					showingAddPatron.toggle()
				}
				Button("Checkout") {
					showingCheckout.toggle()
				}
				.disabled(bookSelection == nil)
			}
		}
		.sheet(isPresented: $showingAddBook) {
			AddBook2View(showingAddBook: $showingAddBook)
		}
		.sheet(isPresented: $showingEditBook) {
			EditBook2View(book: try! bookFromID(bookSelection), showingEditBook: $showingEditBook)
		}
		.sheet(isPresented: $showingAddPatron) {
			AddPatron2View(showing: $showingAddPatron)
		}
		.sheet(isPresented: $showingCheckout) {
			Checkout2View(book: try! bookFromID(bookSelection), showing: $showingCheckout)
		}

	}
	
	func bookFromID(_ id: Book2.ID?) throws -> Book2 {
		if id == nil { throw OAError2.noSelection}
		let book = library.books.first { book in
			book.id == id
		}
		if book == nil { throw OAError2.notFound}
		return book!
	}
	
}

#Preview {
    ContentView()
}
