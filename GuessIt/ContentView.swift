//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    // Slider state properties
    @State private var currentValue = Float.random(in: 0...1)
    @State private var targetValue = Float.random(in: 0...1)
    @State private var showingScoreAlert = false
    
    // Set max play range
    private let maxPlayValue = 50
    
    private var delta: Int {
        abs(scale(currentValue - targetValue))
    }
    
    private var score: Int {
        Int(100 - 100 * delta / maxPlayValue)
    }
    
    // Calculate thumb opacity corresponding to guessed value proximity
    // to the target value. Slider total range is being taken into account
    private var thumbAlpha: CGFloat {
        CGFloat(1 - abs(currentValue - targetValue))
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(scale(targetValue))")
            
            HStack {
                Text("0")
                TestSlider(
                    currentValue: $currentValue,
                    thumbAlpha: thumbAlpha,
                    thumbColor: .red
                )
                Text("\(maxPlayValue)")
            }
            
            Button("Проверь меня!") { showingScoreAlert.toggle() }
            .alert(
                "Your Score",
                isPresented: $showingScoreAlert,
                actions: {},
                message: {
                    Text("\(score)")
                }
            )
            
            Button("Начать заново") {
                restart()
            }
        }
        .padding()
    }
    
    private func restart() {
        targetValue = Float(Int.random(in: 0...maxPlayValue))
        currentValue = Float.random(in: 0...1)
    }
    
    private func scale(_ value: Float) -> Int {
        Int(Float(maxPlayValue) * value)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
