//
//  Project: CanvasTimelineAnimations_SwiftUI
//  File: ContentView.swift
//  Created by Noah Carpenter 
//
//  📺 YouTube: Noah Does Coding
//  https://www.youtube.com/@NoahDoesCoding
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Dream Big. Code Bigger 🚀
//

// Import SwiftUI for building user interfaces
import SwiftUI

// ContentView shows a single animated pulsing ellipse using SwiftUI's TimelineView and Canvas.
struct ContentView: View {
    var body: some View {
        
        // TimelineView provides smooth animation by updating the view according to the animation timeline
        TimelineView(.animation) { context in
            // Canvas allows for custom vector drawing
            Canvas { ctx, size in
                
                // Calculate the center point of the canvas
                let center = CGPoint(x: size.width / 2, y: size.height / 2)
                
                // Use current time and sine function to create smooth pulsing animation value
                let t = context.date.timeIntervalSinceReferenceDate
                let pulse = (sin(t * 2 ) + 1) / 2
                
                // Calculate the radius of the ellipse based on the pulse value
                let radius = 40 + pulse * 120
                // Define the rectangle bounding the ellipse based on center and radius
                let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
                
                // Draw the ellipse with a linear gradient stroke
                ctx.stroke(Path(ellipseIn: rect), with: .linearGradient(Gradient(colors: [.purple, .orange]), startPoint: CGPoint(x: rect.minX, y: rect.minY), endPoint: CGPoint(x: rect.maxX, y: rect.maxY)), lineWidth: 4)
                
            }
            // Set background color to black and ignore safe area for full screen appearance
            .background(.black)
            .ignoresSafeArea(.all)
        }
        
    }
}

// Preview for Xcode Canvas
#Preview {
    ContentView()
}
