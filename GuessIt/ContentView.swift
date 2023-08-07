//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value: Float = 0
    @State private var thumbOpacity: CGFloat = 1
    
    private let game = Game()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(Int(value))")
                .font(.largeTitle)
            Text("Подвиньте слайдер как можно ближе к: \(game.targetValue.formatted())")
            
            HStack {
                Text("\(game.minPlayValue.formatted())")
                TestSlider(
                    currentValue: $value,
                    minValue: game.minPlayValue,
                    maxValue: game.maxPlayValue
                )
                
                Text("\(game.maxPlayValue.formatted())")
            }
            
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
    
    private func setThumbOpacity(for value: Float) {
        let range = game.maxPlayValue - game.minPlayValue
        let delta = abs(Int(value) - game.targetValue)
        thumbOpacity = CGFloat(1 - delta / range)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
