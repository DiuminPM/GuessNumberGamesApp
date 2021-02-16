//
//  SliderView.swift
//  GuessNumberGamesApp
//
//  Created by DiuminPM on 16.02.2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var valueSlider: Double
    var alphaValue: Int
    var body: some View {
        HStack {
            Text("0")
            ColorUISlider(value: $valueSlider, alphaValue: alphaValue)
            Text("100")
        }
      
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(valueSlider: .constant(50), alphaValue: 100)
    }
}
