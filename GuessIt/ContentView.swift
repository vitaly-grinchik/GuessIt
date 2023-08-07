//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = Game().targetValue
    
    @EnvironmentObject private var game: Game
    
    private let slider = TestSlider(currentValue: .constant(10))
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(Int(value))")
                .font(.largeTitle)
            Text("Подвиньте слайдер как можно ближе к: \(game.targetValue.formatted())")
            
            HStack {
                Text("\(slider.minValue.formatted())")
                TestSlider(currentValue: $value)
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Game())//currentValue: .constant(10))
    }
}
