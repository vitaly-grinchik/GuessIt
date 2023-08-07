//
//  TestSlider.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct TestSlider: UIViewRepresentable {
        
    @Binding var currentValue: Float
    @Binding var thumbOpacity: CGFloat
    
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
            currentValue: .constant(50),
            thumbOpacity: .constant(1))
    }
}
