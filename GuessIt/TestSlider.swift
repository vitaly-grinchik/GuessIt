//
//  TestSlider.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//


// UIKit view embedding into SwiftUI view struct
import SwiftUI

struct TestSlider: UIViewRepresentable {
        
    @Binding var currentValue: Float
    @Binding var thumbAlpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
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
        uiView.thumbTintColor = UIColor(
            red: 1.0,
            green: 0.0,
            blue: 0.0,
            alpha: thumbAlpha
        )
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
            currentValue: .constant(0),
            thumbAlpha: .constant(1))
    }
}
