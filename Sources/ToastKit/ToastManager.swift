//
//  ToastManager.swift
//  ToastKit
//
//  Created by Andy Kale on 2025-05-10.
//

#if canImport(UIKit)
import SwiftUI
import Combine

@MainActor
public final class ToastManager: ObservableObject {
    @Published public var message: String?
    @Published public var type: ToastType = .info
    @Published public var theme: ToastTheme = .standard
    
    // Keep a reference so we can cancel a pending hide
    private var dismissWorkItem: DispatchWorkItem?

    public init() {}

    
    public func show(_ text: String, type: ToastType = .info, duration: TimeInterval = 2.5, haptic: Bool = true, theme: ToastTheme = .standard) {
        withAnimation {
            self.message = text
            self.type = type
            self.theme = theme
        }

        if haptic {
            Task { @MainActor in
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(notificationType(for: type))
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                self.message = nil
            }
        }
    }
    
    /// Shows a toast that never auto‑hides—
    /// until you explicitly call `hide()` or show another toast.
    public func showPersistent(
        _ text: String,
        type: ToastType = .info,
        haptic: Bool = true,
        theme: ToastTheme = .standard
    ) {
        // cancel any pending auto‑hide
        dismissWorkItem?.cancel()

        withAnimation {
            self.message = text
            self.type = type
            self.theme = theme
        }

        if haptic {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(notificationType(for: type))
        }
        // NOTE: no DispatchWorkItem, so it stays up.
    }
//        // Just forward to `show(..., duration: nil)`
//        show(text, type: type, duration: nil, haptic: haptic)
//    }

    private func notificationType(for type: ToastType) -> UINotificationFeedbackGenerator.FeedbackType {
        switch type {
        case .success: return .success
        case .warning: return .warning
        case .error:   return .error
        case .info:    return .success
        }
    }
}
#endif
