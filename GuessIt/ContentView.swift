//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    // Slider state properties
    @State private var currentValue: Float = 0
    @State private var thumbAlpha: CGFloat = 1
    // Game properties
    @State private var targetValue = Float.random(in: 0...100).rounded()
    @State private var showingScoreAlert = false
    
    private let minPlayValue: Float = 0
    private let maxPlayValue: Float = 100
     
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue.formatted())")
            
            HStack {
                Text("\(minPlayValue.formatted())")
                TestSlider(currentValue: $currentValue, thumbAlpha: $thumbAlpha)
                    .onChange(of: currentValue) { newValue in
                        setThumbAlpha()
                    }
                        
                Text("\(maxPlayValue.formatted())")
            }
            
            Button("Проверь меня!") { showingScoreAlert.toggle() }
            .alert(
                "Your Score",
                isPresented: $showingScoreAlert,
                actions: {},
                message: {
                    Text("\(getScore())")
                }
            )
            
            Button("Начать заново") {
                restart()
            }
        }
        .padding()
    }
    
    private func restart() {
        targetValue = Float.random(in: 0...100).rounded()
        currentValue = 0.0
    }
    
    // Calculate thumb opacity corresponding to guessed value proximity
    // to the target value. Slider total range is being taken into account
    private func setThumbAlpha() {
        let range = maxPlayValue - minPlayValue
        let delta = abs(currentValue - targetValue)
        thumbAlpha =  CGFloat(1 - delta / range)
    }
    
    private func getScore() -> Int {
        let range = maxPlayValue - minPlayValue
        let delta = abs(currentValue - targetValue)
        
        return Int(100 - 100 * delta / range)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
