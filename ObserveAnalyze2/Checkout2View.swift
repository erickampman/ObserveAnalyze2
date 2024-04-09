//
//  CheckoutView.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/9/24.
//

import SwiftUI

struct Checkout2View: View {
	@Environment(Library2.self) private var library
	@Bindable var book: Book2
	@Binding var showing: Bool
	@State private var selectedPatron: Patron2.ID?
	
	init(book: Book2, showing: Binding<Bool>, selectedPatron: Patron2.ID? = nil) {
		self.book = book
		_showing = showing
		self.selectedPatron = selectedPatron
	}

    var body: some View {
		VStack {
			Picker("Patron", selection: $selectedPatron) {
				Text("Pick a Patron").tag(nil as String?)
				ForEach(library.patrons) { patron in
					Text("\(patron.name)")
						.tag(patron.name as String?)
				}
			}
			HStack {
				Button("Save") {
					book.setPatron(selectedPatron!)
					showing = false
				}
				.disabled(selectedPatron == nil)
				Button("Cancel") {
					showing = false
				}
			}
		}
		.padding()
    }

}

#Preview {
	let book = Book2(author: "Fred", title: "Fred's Book")
	@State var showing = true
    return Checkout2View(book: book, showing: $showing)
}
