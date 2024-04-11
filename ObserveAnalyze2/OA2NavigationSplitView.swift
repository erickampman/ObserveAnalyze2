//
//  OA2NavigationSplitView.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/10/24.
//

import SwiftUI

struct OA2NavigationSplitView: View {
	@Environment(Library2.self) private var library
	@State private var bookSelection: Book2.ID?
	@State private var showingEditBook = false
	@State private var showingCheckout = false
	@State private var showingAddBook = false
	@State private var showingAddPatron = false

    var body: some View {
		NavigationSplitView {
			GeometryReader { outerGP in
				VStack {
					HStack {
						Text("Books")
						Button("Add") {
							showingAddBook.toggle()
						}
						Button("Edit Book") {
							showingEditBook.toggle()
						}
						.disabled(bookSelection == nil)
						Button("Checkout") {
							showingCheckout.toggle()
						}
						.disabled(bookSelection == nil)
					}
						.font(.title3)
					GeometryReader { gp in
						ScrollView(.vertical) {
							Text("\(gp.frame(in: CoordinateSpace.named("OuterVStack")).height)")
							Text("\(outerGP.frame(in: CoordinateSpace.local).height)")
							List(library.books, selection: $bookSelection) { book in
								Text(book.id)
								//								Book2View(book: book)
							}
							.frame(height: abs(outerGP.frame(in: CoordinateSpace.local).height) / 2.0 - 10.0)
						}
					}
					.padding()
					HStack {
						Text("Patrons")
							.font(.title3)
						Button("Add") {
							showingAddPatron.toggle()
						}
					}
					GeometryReader { gp in
						ScrollView(.vertical) {
							List {
								ForEach(library.patrons) { patron in
									NavigationLink {
										Patron2View(patron: patron)
									} label: {
										Text("\(patron.name)")
									}
								}
							}
							.frame(height: abs(outerGP.frame(in: CoordinateSpace.local).height) / 2.0 - 10.0)
						}
					}
					.padding()
				}
				.sheet(isPresented: $showingCheckout) {
					Checkout2View(book: selectedBook()!, showing: $showingCheckout)
				}
				.sheet(isPresented: $showingAddBook) {
					AddBook2View(showingAddBook: $showingAddBook)
				}
				.sheet(isPresented: $showingEditBook) {
					EditBook2View(book: selectedBook()!, showingEditBook: $showingEditBook)
				}
				.sheet(isPresented: $showingAddPatron) {
					AddPatron2View(showing: $showingAddPatron)
				}
			}
			.frame(minHeight: 200)

		} detail: {
			if bookSelection != nil {
				Book2View(book: selectedBook()!)
			}
		}
    }
		  
	func selectedBook() -> Book2? {
		guard let selection = bookSelection else { return nil }
		let ret = library.books.first { book in
			book.id == selection
		}
		
		return ret
	}
}

#Preview {
    OA2NavigationSplitView()
}
