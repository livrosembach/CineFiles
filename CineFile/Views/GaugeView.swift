//
//  GraphicView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 01/06/25.
//

import SwiftUI

struct GaugeView: View {
    var value: Double // de 0 a 100
    var color: Color

    var body: some View {
        ZStack {
            // Arco de fundo (cinza)
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(Color.white.opacity(0.3), lineWidth: 30)
                .rotationEffect(.degrees(180))

            // Arco de valor (personalizado)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(max(value, 0), 100) / 200))
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: 30, lineCap: .round)
                )
                .rotationEffect(.degrees(180))

            // Ponteiro
            Needle(value: value)
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 100, height: 100)
                .foregroundStyle(.white)

            // Valor numérico
            Text("\(Int(value))%")
                .font(.title)
                .bold()
                .offset(y: 50)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 200)
    }
}


struct Needle: Shape {
    var value: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        let angle = Angle(degrees: 180 * (min(max(value, 0), 100) / 100))
        let endX = center.x + radius * cos(angle.radians - .pi)
        let endY = center.y + radius * sin(angle.radians - .pi)

        path.move(to: center)
        path.addLine(to: CGPoint(x: endX, y: endY))
        
        return path
    }
}
