//
//  TestSlider.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct TestSlider: UIViewRepresentable {
        
    @Binding var currentValue: Float
    
    // Default values - can be set different
    var minValue = 0
    var maxValue = 100
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(minValue)
        slider.maximumValue = Float(maxValue)
        slider.value = currentValue
        slider.thumbTintColor = UIColor(
            red: 1.0,
            green: 0.0,
            blue: 0.0,
            alpha: 1
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
    
    private func setThumbOpacity() {
//        let range = game.maxPlayValue - game.minPlayValue
//        let delta = abs(Int(value) - game.targetValue)
//        thumbOpacity = CGFloat(1 - delta / range)
    }

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
        TestSlider(currentValue: .constant(20))
    }
}
