//
//  DummyTodoAppApp.swift
//  DummyTodoApp
//
//  Created by Justin Pearson on 1/7/26.
//

import SwiftUI
import SwiftData

@main
struct DummyTodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
