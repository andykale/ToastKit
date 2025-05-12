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

    public init() {}

    
    public func show(_ text: String, type: ToastType = .info, duration: TimeInterval = 2.5, haptic: Bool = true) {
        withAnimation {
            self.message = text
            self.type = type
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
    
    public func showPersistent(
        _ text: String,
        type: ToastType = .info,
        haptic: Bool = true
    ) {
        // Just forward to `show(..., duration: nil)`
        show(text, type: type, duration: nil, haptic: haptic)
    }

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
