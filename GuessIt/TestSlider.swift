//
//  TestSlider.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

import SwiftUI

struct TestSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    
    private let sliderMinValue: Float = 0
    private let sliderMaxValue: Float = 100
    private let sliderInitValue: Float = 50
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = sliderMinValue
        slider.maximumValue = sliderMaxValue
        slider.value = sliderInitValue
        slider.thumbTintColor = UIColor(
            red: 1.0,
            green: 0.0,
            blue: 0.0,
            alpha: CGFloat(sliderValue / sliderMaxValue + 0.05)
        )
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMoved),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
    
    private func getThumbOpacity() -> Float {
        return Float()
    }
}

extension TestSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(value: Binding<Float>) {
            self._sliderValue = value
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct TestSlider_Previews: PreviewProvider {
    static var previews: some View {
        TestSlider(sliderValue: .constant(30))
    }
}
