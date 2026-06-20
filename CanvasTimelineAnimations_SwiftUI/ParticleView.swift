//
        //
    //  Project: CanvasTimelineAnimations_SwiftUI
    //  File: ParticleView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

struct ParticleView: View {
    let particleCount = 200
    let orbitCount = 5
    var body: some View {
        
        TimelineView(.animation){ context in
            Canvas { ctx, size in
                
                guard let dot = ctx.resolveSymbol(id: "dot") else { return }
                
                let center = CGPoint(x: size.width / 2, y: size.height / 2)
                let maxR = min(size.width, size.height) / 2 - 20
                let t = context.date.timeIntervalSinceReferenceDate
                
                for i in 0..<particleCount {
                    let orbit = Double( i % orbitCount) + 1
                    let radius = (orbit / Double(orbitCount)) * maxR
                    let speed = 0.3 / orbit
                    let phase = Double(i) / Double(particleCount) * .pi * 2
                    let angle = t * speed + phase
                    
                    let x = center.x + cos(angle) * radius
                    let y = center.y + sin(angle) * radius
                    
                    ctx.draw(dot, at: CGPoint(x: x, y: y))
                }
                
            } symbols: {
                Circle()
                    .fill(RadialGradient(colors: [.purple, .orange], center: .center, startRadius: 0, endRadius: 4))
                    .frame(width: 8, height: 8)
                    .tag("dot")
            }
            
        }
        
    }
}

#Preview {
    ParticleView()
}
