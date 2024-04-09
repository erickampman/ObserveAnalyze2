//
//  AddPatron2View.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/8/24.
//

import SwiftUI

struct AddPatron2View: View {
	@Environment(Library2.self) private var library
	@Binding var showing: Bool
	@State var name = ""

    var body: some View {
		VStack {
			Text("# of Patrons: \(library.patrons.count)")
			Form {
				Section(header: Text("Add Patron")) {
					TextField("Name", text: $name)
						.frame(minWidth: 200)
				}
			}
			HStack {
				Button("Add") {
					library.patrons.append(Patron2(name: name))
					showing = false
				}
				.disabled(name.isEmpty)
				Button("Cancel") {
					showing = false
				}
			}
		}
		.padding()
    }
}

#Preview {
	@State var showing = true
    return AddPatron2View(showing: $showing)
}
