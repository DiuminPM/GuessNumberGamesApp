//
//  ContentView.swift
//  GuessNumberGamesApp
//
//  Created by DiuminPM on 16.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue: Double = 50
    @State private var showAlert = false
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            SliderView(valueSlider: $currentValue,
                       alphaValue: computeScore()
            )
            ButtomView(
                showAlert: $showAlert,
                title: "Проверь меня",
                action: { showAlert = true },
                currentScore: computeScore())
            ButtomView(
                title: "Начать заново",
                action: { targetValue = Int.random(in: 1...100) }
            )
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtomView: View {
    @Binding var showAlert: Bool
    let title: String
    let action: () -> Void
    let currentScore: Int
    
    
    var body: some View {
        Button(title, action: action)
            .alert(isPresented: $showAlert, content: {
                Alert(
                    title: Text("Your score:"),
                    message: Text("\(currentScore)")
                )
            })
            .padding()
    }
    
    init(showAlert: Binding<Bool> = .constant(false), title: String, action: @escaping () -> Void, currentScore: Int = 0) {
        self._showAlert = showAlert
        self.title = title
        self.action = action
        self.currentScore = currentScore
    }
}
