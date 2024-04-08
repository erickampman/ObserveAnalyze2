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
			}
		}
		.sheet(isPresented: $showingAddBook) {
			AddBook2View(showingAddBook: $showingAddBook)
		}
	}
}

#Preview {
    ContentView()
}
