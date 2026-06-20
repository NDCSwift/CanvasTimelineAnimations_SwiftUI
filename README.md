# 🌀 Canvas Timeline Animations (SwiftUI)

A small SwiftUI playground showing how to drive smooth, frame-synced animations with `TimelineView` and `Canvas` — no UIKit, no third-party libraries.

---

## 🤔 What this is

This project demonstrates three self-contained animated scenes built entirely with SwiftUI's `Canvas` and `TimelineView(.animation)`. Each scene derives its motion from a single time value locked to the screen's refresh rate, so the math — not a stack of view animators — produces the motion. It's a practical look at procedural, time-based drawing in pure SwiftUI.

## ✅ Why you'd use it

- **TimelineView + Canvas pattern** — Learn how `TimelineView(.animation)` feeds a continuous time value into `Canvas` for buttery, frame-accurate rendering.
- **Procedural motion from math** — Pulsing circles, orbiting particles, and expanding ripples all come from trig and phase offsets, not chained view modifiers.
- **Performance-minded drawing** — Shows real optimizations like `resolveSymbol` for cheap repeated draws and `Canvas(opaque:)` to skip alpha compositing.

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtube.com/watch?v=PLACEHOLDER)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone
```bash
git clone https://github.com/NDCSwift/CanvasTimelineAnimations_SwiftUI.git
cd CanvasTimelineAnimations_SwiftUI
```

### 2. Open
Open `CanvasTimelineAnimations_SwiftUI.xcodeproj` in Xcode.

### 3. Team
Select the project in the navigator → **Signing & Capabilities** → choose your development **Team**.

### 4. Bundle ID
Set a unique **Bundle Identifier** (e.g. `com.yourname.CanvasTimelineAnimations`) so the app can build and run on your device.

## 🛠️ Notes

- Three independent scenes live in their own files: `ContentView.swift` (pulsing circle), `ParticleView.swift` (orbiting particles), and `PulseView.swift` (expanding ripple rings).
- All motion is driven by `context.date.timeIntervalSinceReferenceDate`, so animations stay in sync with the display refresh rate.
- To preview a specific scene, use its Xcode Canvas `#Preview`, or swap the view shown in `CanvasTimelineAnimations_SwiftUIApp.swift`.

## 📦 Requirements

- Xcode 15 or later
- iOS 17 or later (uses `Canvas` and `TimelineView`)
- Swift 5.9+

---

📺 [Watch the guide on YouTube](https://youtube.com/watch?v=PLACEHOLDER)
