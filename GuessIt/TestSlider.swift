//
//  TestSlider.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct TestSlider: UIViewRepresentable {
        
    @Binding var currentValue: Float
    var targetValue: Float
    
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
        let thumpOpacity = getThumbOpacity()
        uiView.value = currentValue
        uiView.thumbTintColor = UIColor(
            red: 1.0,
            green: 0.0,
            blue: 0.0,
            alpha: thumpOpacity == 0 ? 0.05 : thumpOpacity
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
    
    // Calculate thumb opacity corresponding to guessed value proximity
    // to the target value. Slider total range is being taken into account
    private func getThumbOpacity() -> CGFloat {
        let range = Float(maxValue - minValue)
        let delta = abs(currentValue - targetValue)
        return CGFloat(1 - delta / range)
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
        TestSlider(
            currentValue: .constant(100),
            targetValue: Float(0)
        )
    }
}
