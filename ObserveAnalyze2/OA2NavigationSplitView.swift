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
	@State private var showingCheckout = false
	@State private var showingAddBook = false

    var body: some View {
		NavigationSplitView {
			GeometryReader { outerGP in
				VStack {
					HStack {
						Text("Books")
						Button("Add") {
							showingAddBook.toggle()
						}
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
							/*
							 List {
							 ForEach(library.books) { book in
							 NavigationLink {
							 Book2View(book: book)
							 } label: {
							 Text("'\(book.title)' by '\(book.author)'")
							 }
							 }
							 }
							 */
							List(library.books, selection: $bookSelection) { book in
								Text(book.id)
								//								Book2View(book: book)
							}
							.frame(height: abs(outerGP.frame(in: CoordinateSpace.local).height) / 2.0 - 10.0)
						}
					}
					.padding()
					Text("Patrons")
						.font(.title3)
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

			}
			.frame(minHeight: 200)

		} content: {
			if bookSelection != nil {
				Book2View(book: selectedBook()!)
			}
		} detail: {
			Text("Detail")
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
