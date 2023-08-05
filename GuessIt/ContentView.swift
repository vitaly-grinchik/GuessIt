//
//  ContentView.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct ContentView: View {
    
//    @Binding var value: Float
    
    private let targetValue = Randomizer().randomValue
    
    var body: some View {
        VStack(spacing: 30) {
            
//            TestSlider(sliderValue: $value)
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
        ContentView() //(value: .constant(50.0))
    }
}
