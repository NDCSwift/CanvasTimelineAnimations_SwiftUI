//
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

    

import SwiftUI

struct ContentView: View {
    var body: some View {

        
        TimelineView(.animation) { context in
            Canvas {
                ctx, size in
                
                let center = CGPoint(x: size.width / 2, y: size.height / 2)
                
                let t = context.date.timeIntervalSinceReferenceDate
                let pulse = (sin(t * 2 ) + 1) / 2
                
                let radius = 40 + pulse * 120
                let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
                
                ctx.stroke(Path(ellipseIn: rect), with: .linearGradient(Gradient(colors: [.purple, .orange]), startPoint: CGPoint(x: rect.minX, y: rect.minY), endPoint: CGPoint(x: rect.maxX, y: rect.maxY)), lineWidth: 4)
                
                
            }
            .background(.black)
            .ignoresSafeArea(.all)
        }
        
        
    }
}

#Preview {
    ContentView()
}
