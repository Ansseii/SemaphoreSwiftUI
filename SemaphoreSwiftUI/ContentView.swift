//
//  ContentView.swift
//  SemaphoreSwiftUI
//
//  Created by Aleksandr on 14.10.2020.
//

import SwiftUI

enum AvailableLights {
    case red, yellow, green, none
}

struct ContentView: View {
    
    @State private var currentLight = AvailableLights.none
    @State private var currentText = "Start"
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .ignoresSafeArea()
            VStack {
                Semaphore(current: currentLight)
                Spacer()
                ActionButton(text: currentText, action: changeLight)
            }
        }
    }
    
    private func changeLight() {
        switch currentLight {
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green, .none:
            currentLight = .red
        }
        currentText = "Next"
    }
}

struct ActionButton: View {
    
    fileprivate let text: String
    fileprivate let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.bold)
                .font(.title)
                .frame(width: 175, height: 50)
                .background(Color.gray)
                .foregroundColor(.black)
                .padding(10)
                .border(Color.gray, width: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
