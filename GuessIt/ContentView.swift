//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value: Float = 0
    @State private var showingScoreAlert = false
    
    private let game = Game(minPlayValue: 0, maxPlayValue: 100)
    
    private var score: Int {
        game.getScore(for: value)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(Int(value))")
                .font(.largeTitle)
            Text("Подвиньте слайдер как можно ближе к: \(game.targetValue.formatted())")
            
            HStack {
                Text("\(game.minPlayValue.formatted())")
                TestSlider(
                    currentValue: $value,
                    targetValue: Float(game.targetValue),
                    minValue: game.minPlayValue,
                    maxValue: game.maxPlayValue
                )
                
                Text("\(game.maxPlayValue.formatted())")
            }
            
            Button("Проверь меня!") { showingScoreAlert.toggle() }
            .alert(
                "Your Score",
                isPresented: $showingScoreAlert,
                actions: {},
                message: {
                    Text("\(score.formatted())")
                }
            )
            
            Button("Начать заново") {
                restart()
            }
        }
        .padding()
    }
    
    private func restart() {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
