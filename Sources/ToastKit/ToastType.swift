//
//  ToastType.swift
//  ToastKit
//
//  Created by Andy Kale on 2025-05-10.
//

#if canImport(UIKit)
import SwiftUI

public enum ToastType {
    case success
    case warning
    case error
    case info

    public var backgroundColor: Color {
        switch self {
        case .success: return Color.green.opacity(0.85)
        case .warning: return Color.orange.opacity(0.85)
        case .error:   return Color.red.opacity(0.85)
        case .info:    return Color.black.opacity(0.85)
        }
    }

    public var iconName: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error:   return "xmark.octagon.fill"
        case .info:    return "info.circle.fill"
        }
    }
}

public enum ToastTheme: Equatable {
    case standard
    case solidBG
}

#endif
