//
//  ContentView.swift
//  GuessNumberGamesApp
//
//  Created by DiuminPM on 16.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Double.random(in: 0...100)
    @State private var currentValue: Double = 0
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(lround(targetValue))")
            SliderView(valueSlider: $currentValue, alphaValue: CGFloat(100 - abs(currentValue - targetValue))/100)
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

