//
//  ContentView.swift
//  ToastKitDemo
//
//  Created by Andy Kale on 2025-05-11.
//

import SwiftUI
import ToastKit

struct ContentView: View {
    @EnvironmentObject var toastManager: ToastManager

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("ToastKit Demo")
                    .font(.largeTitle)
                    .bold()

                Button("Show Success") {
                    toastManager.show("Upload complete!", type: .success)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)

                Button("Show Warning") {
                    toastManager.show("Low battery warning!", type: .warning)
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)

                Button("Show Error") {
                    toastManager.show("Failed to save data.", type: .error)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

                Button("Show Info") {
                    toastManager.show("You're viewing a demo.", type: .info)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .padding()

            ToastOverlay()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ToastManager())
}
