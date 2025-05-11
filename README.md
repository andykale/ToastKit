# ToastKit

![Swift](https://img.shields.io/badge/Swift-5.7-orange)
![iOS](https://img.shields.io/badge/iOS-14%2B-blue)
![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen)
![License](https://img.shields.io/badge/license-MIT-lightgray)

A lightweight SwiftUI toast notification system with configurable types, animations, and optional haptics. Easily show unobtrusive alerts like success, error, or info messages.

## ✨ Features
- Clean, customizable toast overlay
- Four toast types: success, warning, error, info
- Built-in support for haptic feedback
- Smooth transition animations
- Easy integration with `.environmentObject`

---

## 📦 Installation

### Swift Package Manager
1. In Xcode, open your project.
2. Go to `File > Add Packages...`
3. Enter the URL to this repository:
   ```
   https://github.com/andykale/ToastKit.git
   ```
4. Choose the latest version and click **Add Package**.

---

## 🚀 Usage

### 1. Import ToastKit
```swift
import ToastKit
```

### 2. Add the ToastManager to your environment
```swift
@StateObject var toastManager = ToastManager()

var body: some View {
    ContentView()
        .environmentObject(toastManager)
}
```

### 3. Show a toast
```swift
toastManager.show("Saved successfully!", type: .success)
```

### 4. Add the overlay to your UI
```swift
ToastOverlay()
```
This can be placed globally in your `ZStack` or root view.

---

## 💡 Toast Types

```swift
enum ToastType {
    case success     // ✅ green
    case warning     // ⚠️ orange
    case error       // ❌ red
    case info        // ℹ️ black
}
```

All toasts use Apple SF Symbols and automatically apply a light haptic.

---

## 🛠 Customization
- Change colors or icons in `ToastType.swift`
- Modify transitions or timing in `ToastOverlay.swift`

---

## ℹ️ Advanced Usage (ViewModel integration)
If you're calling `toastManager.show(...)` from a view model or external object:

- Inject your `ToastManager` into the view model via its initializer:

```swift
let toastManager = ToastManager()
let viewModel = YourViewModelName(toastManager: toastManager)
```

- Ensure your view includes `.environmentObject(toastManager)` for `ToastOverlay` to respond.

- ToastManager already uses `withAnimation` internally, so transitions will work correctly. If manually assigning `message`, wrap it in:

```swift
withAnimation {
    toastManager.message = "Something happened"
}
```

---

## 🎥 Demo Preview

Here's a quick example to see ToastKit in action:

```swift
struct ToastDemoView: View {
    @StateObject var toastManager = ToastManager()

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button("Show Success") {
                    toastManager.show("Upload complete!", type: .success)
                }
                Button("Show Warning") {
                    toastManager.show("Low battery warning!", type: .warning)
                }
                Button("Show Error") {
                    toastManager.show("Failed to save data.", type: .error)
                }
                Button("Show Info") {
                    toastManager.show("You're viewing a demo.", type: .info)
                }
            }
        }
        .environmentObject(toastManager)
        .overlay(ToastOverlay())
    }
}
```

This view allows you to test all toast styles interactively.

---

## 📱 Platform Support
- ✅ iOS 14+
- ❌ Not designed for macOS or watchOS yet

---

## 📄 License
MIT License — free to use, modify, and distribute.

---

## 🙌 Contribute
Feel free to open a PR to improve visuals, add styling, or extend support!

---

## 🔗 Related
Check out [AnimatedVisibility](https://github.com/andykale/animated-visibility-swiftui) for clean SwiftUI transition helpers.
