//
//  GuessItApp.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

@main
struct GuessItApp: App {
    
    @StateObject private var game = Game(minPlayValue: 100, maxPlayValue: 200)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
