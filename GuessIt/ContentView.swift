//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = Float(0)
    
    @EnvironmentObject private var game: Game
    
    private let slider = TestSlider(
        currentValue: .constant(50),
        minValue: 100,
        maxValue: 200,
        thumbOpacity: 1
    )
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(Int(value))")
                .font(.largeTitle)
            Text("Подвиньте слайдер как можно ближе к: \(game.targetValue.formatted())")
            
            HStack {
                Text("\(slider.minValue.formatted())")
                TestSlider(currentValue: $value, thumbOpacity: getThumbOpacity(for: value))
                Text("\(slider.maxValue.formatted())")
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
    
    private func getThumbOpacity(for value: Float) -> CGFloat {
        let range = slider.maxValue - slider.minValue
        let delta = abs(Int(value) - game.targetValue)

        return CGFloat(1 - delta / range)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Game())//currentValue: .constant(10))
    }
}
