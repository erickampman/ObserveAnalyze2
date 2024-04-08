//
//  ObserveAnalyze2App.swift
//  ObserveAnalyze2
//
//  Created by Eric Kampman on 4/8/24.
//

import SwiftUI

@main
struct ObserveAnalyze2App: App {
	@State private var library = Library2()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(library)
        }
    }
}
