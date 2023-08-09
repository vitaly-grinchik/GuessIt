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
    
    // Set play range
    private let minPlayValue = 0
    private let maxPlayValue = 100
        
    // Actually this is a ratio coefficient for set play range relatively to slider default range (0...1)
    private var ratio: Int {
        maxPlayValue - minPlayValue
    }
    
    private var delta: Int {
        ratio * abs(scale(currentValue - targetValue))
    }
    
    private var score: Int {
        Int(100 * delta / ratio)
    }
    
    // Calculate thumb opacity corresponding to guessed value proximity
    // to the target value. Slider total range is being taken into account
    private var thumbAlpha: CGFloat {
        CGFloat(abs(currentValue - targetValue))
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(scale(targetValue))")
            
            HStack {
                Text("\(minPlayValue.formatted())")
                TestSlider(
                    currentValue: $currentValue,
                    thumbAlpha: thumbAlpha,
                    thumbColor: .red
                )
                Text("\(maxPlayValue.formatted())")
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
        targetValue = Float.random(in: 0...1)
        currentValue = Float.random(in: 0...1)
    }
    
    private func scale(_ value: Float) -> Int {
        Int(Float(ratio) * value)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
