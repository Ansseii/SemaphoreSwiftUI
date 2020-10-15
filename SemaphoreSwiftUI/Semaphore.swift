//
//  Semaphore.swift
//  SemaphoreSwiftUI
//
//  Created by Aleksandr on 14.10.2020.
//

import SwiftUI

struct Semaphore: View {
    
    let current: AvailableLights
    
    var body: some View {
        ZStack {
            VStack {
                Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
                    .frame(width: 200, height: 410)
                    .cornerRadius(10)
                Spacer()
            }
            VStack {
                Light(color: .red, alpha: current == .red ? 1 : 0.2)
                Light(color: .yellow, alpha: current == .yellow ? 1 : 0.2)
                Light(color: .green, alpha: current == .green ? 1 : 0.2)
                Spacer()
            }.padding()
        }
    }
}

struct Light: View {
    
    fileprivate let color: UIColor
    fileprivate let alpha: CGFloat
    
    var body: some View {
        Color(color.withAlphaComponent(alpha))
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 5))
    }
}

struct Semaphore_Previews: PreviewProvider {
    static var previews: some View {
        Semaphore(current: .red)
    }
}
