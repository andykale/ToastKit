//
//  ToastOverlay.swift
//  ToastKit
//
//  Created by Andy Kale on 2025-05-10.
//

import SwiftUI

public struct ToastOverlay: View {
    @EnvironmentObject public var toastManager: ToastManager

    public init() {}

    public var body: some View {
        if let message = toastManager.message {
            HStack(spacing: 10) {
                Image(systemName: toastManager.type.iconName)
                    .foregroundColor(toastManager.type.backgroundColor)

                Text(message)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .bold()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(14)
            .shadow(radius: 8)
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .padding(.top, 60)
            .zIndex(1)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .animation(.easeInOut(duration: 0.3), value: toastManager.message)
        }
    }
}
