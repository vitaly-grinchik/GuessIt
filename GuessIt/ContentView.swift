//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var game = Game()
    @State private var value: Float = 0
    @State private var showingScoreAlert = false
    
    private var score: Int {
        game.getScore(for: value)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(game.targetValue.formatted())")
            
            HStack {
                Text("\(game.minPlayValue.formatted())")
                TestSlider(currentValue: $value, thumbAlpha: 1.0)
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
        game = Game()
        value = 0.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
