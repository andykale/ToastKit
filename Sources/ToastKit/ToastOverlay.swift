//
//  ToastOverlay.swift
//  ToastKit
//
//  Created by Andy Kale on 2025-05-10.
//

#if canImport(UIKit)
import SwiftUI

public struct ToastOverlay: View {
    @EnvironmentObject public var toastManager: ToastManager

    public init() {}

    var body: some View {
        Group {
            switch toastManager.theme {
            case .standard:
                HStack {
                    if let iconName = toastManager.type.iconName {
                        Image(systemName: iconName)
                            .foregroundColor(.white)
                    }
                    Text(toastManager.message)
                        .foregroundColor(.white)
                }
                .padding()
                .background(toastManager.type.backgroundColor)
                .cornerRadius(12)
                .shadow(radius: 8)
                .padding(.horizontal)
                .transition(.move(edge: .top).combined(with: .opacity))
            case .solidBG:
                VStack {
                    Spacer()
                    HStack(spacing: 12) {
                        if let iconName = toastManager.type.iconName {
                            Image(systemName: iconName)
                                .foregroundColor(.white)
                        }
                        Text(toastManager.message)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .background(toastManager.type.backgroundColor)
                    .cornerRadius(12)
                    .padding(.bottom, 40)
                    .shadow(radius: 5)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut(duration: 0.3), value: toastManager.message)
                }
                .padding(.horizontal)
            }
        }
    }
    
//    public var body: some View {
//        if let message = toastManager.message {
//            if toastManager.
//            HStack(spacing: 10) {
//                Image(systemName: toastManager.type.iconName)
//                    .foregroundColor(toastManager.type.backgroundColor)
//
//                Text(message)
//                    .font(.callout)
//                    .foregroundColor(.primary)
//                    .bold()
//            }
//            .padding(.horizontal, 16)
//            .padding(.vertical, 10)
//            .background(Color(UIColor.systemBackground))
//            .cornerRadius(14)
//            .shadow(radius: 8)
//            .transition(.move(edge: .bottom).combined(with: .opacity))
//            .padding(.top, 60)
//            .zIndex(1)
//            .frame(maxHeight: .infinity, alignment: .bottom)
//            .animation(.easeInOut(duration: 0.3), value: toastManager.message)
//            //            VStack {
//            //                Spacer()
//            //                HStack(spacing: 12) {
//            //                    Image(systemName: toastManager.type.iconName)
//            //                        .foregroundColor(.white)
//            //
//            //                    Text(message)
//            //                        .foregroundColor(.white)
//            //                        .multilineTextAlignment(.leading)
//            //                }
//            //                .padding()
//            //                .background(toastManager.type.backgroundColor)
//            //                .cornerRadius(12)
//            //                .padding(.bottom, 40)
//            //                .shadow(radius: 5)
//            //                .transition(.move(edge: .bottom).combined(with: .opacity))
//            //                .animation(.easeInOut(duration: 0.3), value: toastManager.message)
//            //            }
//        }
//    }
}
#endif
