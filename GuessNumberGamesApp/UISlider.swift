//
//  UISlider.swift
//  SwitchColorRGB
//
//  Created by DiuminPM on 15.02.2021.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    let alphaValue: CGFloat
    let color: UIColor = .red
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = color.withAlphaComponent(alphaValue)
//        slider.value = Float(value) так как мы проинициировали value в методе updateUIView
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $value)
    }
}

extension ColorUISlider {
    class Coordinator: NSObject{
        @Binding var value: Double
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_sender: UISlider) {
            value = Double(_sender.value)
        }
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(value: .constant(50), alphaValue: 0.5)
    }
}
