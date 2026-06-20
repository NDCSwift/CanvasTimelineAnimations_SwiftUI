//
//  Project: CanvasTimelineAnimations_SwiftUI
//  File: PulseView.swift
//  Created by Noah Carpenter 
//
//  📺 YouTube: Noah Does Coding
//  https://www.youtube.com/@NoahDoesCoding
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Dream Big. Code Bigger 🚀
//

// Import SwiftUI for building the user interface
import SwiftUI

// PulseView displays animated expanding rings using SwiftUI's TimelineView and Canvas.
struct PulseView: View {
    // Number of rings to display
    let ringCount = 10
    
    // Duration for one full pulse cycle
    let period: TimeInterval = 3.0
    
    var body: some View {
        
        // TimelineView provides a timeline that updates regularly to create animations
        TimelineView(.animation) { context in
            
            // Canvas is a drawing surface where we render the rings
            Canvas(opaque: true) { ctx, size in
                
                // Call draw function to render the rings based on current time
                draw(ctx, size: size, date: context.date)
            }
            // Set background color to black
            .background(.black)
            // Make the view ignore safe area to fill entire screen
            .ignoresSafeArea()
        }
        
    }
    
    // Draw function renders the expanding rings on the canvas
    private func draw(_ ctx: GraphicsContext, size: CGSize, date: Date) {
        // Calculate the center point of the view
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        // Determine the maximum radius based on view size
        let maxRadius = min(size.width, size.height) / 2
        
        // Get the current time in seconds since reference date
        let t = date.timeIntervalSinceReferenceDate
        
        // Loop through each ring to draw
        for i in 0..<ringCount {
            // Calculate phase shift for each ring to space them out evenly
            let phase = Double(i) / Double(ringCount)
            
            // Calculate progress of pulse animation for this ring (0 to 1)
            let progress = ((t / period) + phase)
                .truncatingRemainder(dividingBy: 1.0)
            
            // Calculate radius based on progress
            let radius = progress * maxRadius
            // Calculate opacity inversely proportional to progress
            let opacity = 1.0 - progress
            
            // Define the rectangle for the ellipse to be drawn
            let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
            
            // Draw the ring with a linear gradient and variable opacity
            ctx.stroke(
                Path(ellipseIn: rect),
                with: .linearGradient(
                    Gradient(colors: [.purple.opacity(opacity), .orange.opacity(opacity)]),
                    startPoint: CGPoint(x: rect.minX, y: rect.minY),
                    endPoint: CGPoint(x: rect.maxX, y: rect.maxY)
                ),
                lineWidth: 4
            )
        }
    }
}

// Preview provider to display PulseView in the canvas preview
#Preview {
    PulseView()
}
