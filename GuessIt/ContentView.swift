//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
    private let targetValue = Randomizer().randomValue
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            // slider
            
            Button("Проверь меня!") {
                check()
            }
            
            Button("Начать заново") {
                newGame()
            }
        }
        .padding()
    }
    
    private func check() {
        
    }
    
    private func newGame() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
