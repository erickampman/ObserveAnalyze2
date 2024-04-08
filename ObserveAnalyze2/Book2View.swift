//
//  Book2View.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/8/24.
//

import SwiftUI

struct Book2View: View {
	var book: Book2
	var body: some View {
		VStack {
			HStack {
				Text("Title:")
				Text("\(book.title)")
			}
			HStack {
				Text("Author:")
				Text("\(book.author)")
			}
		}
		.padding()
	}
}

#Preview {
	Book2View(book: Book2(author: "Fred Johnson", title: "My First Book"))
}
