//
//  ContentView.swift
//  gradientBorderApp
//
//  Created by YoungK on 2022/09/25.
//

import SwiftUI

struct ContentView: View {
    private let gradientColors: [Color] = [.red, .yellow, .green, .blue, .purple, .red]
    @State  var gradientAngle: Double = 0
    var body: some View {
        Image("IU")
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .mask { RoundedRectangle(cornerRadius: 12) }
            .shadow(radius: 8)
            .overlay {
                gradientBorderView
            }
    }
    var gradientBorderView: some View {
        RoundedRectangle(cornerRadius: 12)
            .strokeBorder(
                AngularGradient(gradient: Gradient(colors: gradientColors), center: .center, angle: .degrees(gradientAngle)))
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                    self.gradientAngle = 360
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
