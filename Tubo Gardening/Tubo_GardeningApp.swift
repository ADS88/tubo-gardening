//
//  Tubo_GardeningApp.swift
//  Tubo Gardening
//
//  Created by Andrew Sturman on 8/8/2025.
//

import SwiftUI

@main
struct Tubo_GardeningApp: App {
    @StateObject private var persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
