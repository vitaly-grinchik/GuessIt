//
//  Game.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import Foundation

class Game: ObservableObject {
    // Value to guess
    @Published var targetValue: Int
    // Play range
    var minPlayValue: Int
    var maxPlayValue: Int
    
    init() {
        // Default play range
        self.minPlayValue = 0
        self.maxPlayValue = 100
        self.targetValue = Int.random(in: minPlayValue...maxPlayValue)
    }
    
    init(minPlayValue: Int, maxPlayValue: Int) {
        self.minPlayValue = minPlayValue
        // Exclude wrong values, min difference should be 50
        self.maxPlayValue = (maxPlayValue - minPlayValue) < 50 ? 50 : maxPlayValue
        self.targetValue = Int.random(in: minPlayValue...maxPlayValue)
    }
    
    func getScore(for value: Int) -> Int {
        let range = maxPlayValue - minPlayValue
        let delta = abs(value - targetValue)
        
        return Int(100 * delta / range)
    }
}
