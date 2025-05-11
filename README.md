# ToastKit

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
   https://github.com/your-username/ToastKit.git
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
Check out [AnimatedVisibility](https://github.com/your-username/AnimatedVisibility) for clean SwiftUI transition helpers.
