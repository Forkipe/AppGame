//
//  AppGameApp.swift
//  AppGame
//
//  Created by Марк Горкій on 19.07.2023.
//

import SwiftUI

@main
struct AppGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
