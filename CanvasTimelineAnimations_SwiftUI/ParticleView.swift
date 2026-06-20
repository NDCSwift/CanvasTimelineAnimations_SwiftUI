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


// Import SwiftUI framework for building user interfaces
import SwiftUI

// ParticleView displays animated particles orbiting in circular paths using SwiftUI's TimelineView and Canvas.
struct ParticleView: View {
    // Number of particles to animate
    let particleCount = 200
    // Number of orbits for the particles
    let orbitCount = 5
    
    // The body defines the view's layout and animation logic
    var body: some View {
        // TimelineView lets the animation update smoothly over time
        TimelineView(.animation) { context in
            // Canvas is used for custom drawing
            Canvas { ctx, size in
                // Try to get the symbol for our particle, defined below in 'symbols:'
                guard let dot = ctx.resolveSymbol(id: "dot") else { return }
                
                // Find the center point of the canvas
                let center = CGPoint(x: size.width / 2, y: size.height / 2)
                // Set the max radius for the orbits (slightly inset from edges)
                let maxR = min(size.width, size.height) / 2 - 20
                // Calculate the current time for animation phase
                let t = context.date.timeIntervalSinceReferenceDate
                
                // Loop to draw each particle
                for i in 0..<particleCount {
                    // Determine which orbit this particle is on
                    let orbit = Double(i % orbitCount) + 1
                    // Calculate radius for this orbit
                    let radius = (orbit / Double(orbitCount)) * maxR
                    // Speed of orbit (outer orbits move slower)
                    let speed = 0.3 / orbit
                    // Phase offset for even distribution of particles along the orbit
                    let phase = Double(i) / Double(particleCount) * .pi * 2
                    // Current angle in the orbit based on time, speed, and phase offset
                    let angle = t * speed + phase
                    
                    // Calculate position of the particle using trigonometry
                    let x = center.x + cos(angle) * radius
                    let y = center.y + sin(angle) * radius
                    // Draw the particle (dot) at this position
                    ctx.draw(dot, at: CGPoint(x: x, y: y))
                }
            } symbols: {
                // Define the appearance of a particle (dot) as a gradient-filled circle
                Circle()
                    .fill(RadialGradient(colors: [.purple, .orange], center: .center, startRadius: 0, endRadius: 4))
                    .frame(width: 8, height: 8)
                    .tag("dot") // Provide an ID to refer to this symbol
            }
        }
    }
}

// Preview for Xcode canvas
#Preview {
    ParticleView()
}
