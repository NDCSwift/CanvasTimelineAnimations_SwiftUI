//
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

    

import SwiftUI

struct PulseView: View {
    let ringCount = 10
    let period: TimeInterval = 3.0
    var body: some View {
        
        TimelineView(.animation) {
            context in
            Canvas(opaque: true) {
                ctx, size in
                draw(ctx, size: size, date: context.date)
            }
            .background(.black)
            .ignoresSafeArea()
        }
        
        
        
    }
    
    private func draw(_ ctx: GraphicsContext, size: CGSize, date: Date) {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let maxRadius = min(size.width, size.height) / 2
        
        let t = date.timeIntervalSinceReferenceDate
        
        for i in 0..<ringCount {
            let phase = Double(i) / Double(ringCount)
            
            let progress = ((t / period) + phase)
                .truncatingRemainder(dividingBy: 1.0)
            
            let radius = progress * maxRadius
            let opacity = 1.0 - progress
            
            let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
            
            ctx.stroke(Path(ellipseIn: rect), with: .linearGradient(Gradient(colors: [.purple.opacity(opacity), .orange.opacity(opacity)]), startPoint: CGPoint(x: rect.minX, y: rect.minY), endPoint: CGPoint(x: rect.maxX, y: rect.maxY)), lineWidth: 4)
            
            
        }
        
    }
}

#Preview {
    PulseView()
}
