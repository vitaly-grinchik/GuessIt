//
//  TestSlider.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct TestSlider: UIViewRepresentable {
        
    @Binding var currentValue: Float
    @EnvironmentObject private var game: Game
    
    // Default values - can be set different
    var minValue: Float = 0
    var maxValue: Float = 100
    var thumbOpacity: CGFloat = 1
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        // Exclude wrong values, min difference should be 50
        slider.minimumValue = minValue < 0 ? 0 : minValue
        slider.maximumValue = (maxValue - minValue) < 50 ? 50 : maxValue
        
        slider.value = currentValue
        slider.thumbTintColor = UIColor(
            red: 1.0,
            green: 0.0,
            blue: 0.0,
            alpha: thumbOpacity
        )
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMoved),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
    
//    private func getThumbOpacity(for value: Float) -> CGFloat {
//        let range = maxValue - minValue
//        let delta = abs(value - game.randomValue)
//
//        return CGFloat(1 - delta / range)
//    }

}

extension TestSlider {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct TestSlider_Previews: PreviewProvider {
    static var previews: some View {
        TestSlider(currentValue: .constant(90))
    }
}
