//
//  AddBook2View.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/8/24.
//

import SwiftUI

struct AddBook2View: View {
	@Environment(Library2.self) private var library
	@Binding var showingAddBook: Bool
	@State private var title = ""
	@State private var author = ""

    var body: some View {
		VStack {
			Form {
				Section(header: Text("Add Book")) {
					TextField("Title", text: $title)
					TextField("Author", text: $author)
				}
				.frame(minWidth: 200)
			}
			HStack {
				Button("Add") {
					let book = Book2(author: author, title: title)
					library.books.append(book)
					showingAddBook = false
					title = ""
					author = ""
				}
				Button("Cancel") {
					showingAddBook = false
					title = ""
					author = ""
				}
			}
		}
		.padding()
    }
}

#Preview {
	let library = Library2()
	@State var showingAddBook = true
	return AddBook2View(showingAddBook: $showingAddBook)
		.environment(library)
}
