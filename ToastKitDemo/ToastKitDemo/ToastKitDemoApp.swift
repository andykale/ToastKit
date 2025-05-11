//
//  ToastKitDemoApp.swift
//  ToastKitDemo
//
//  Created by Andy Kale on 2025-05-11.
//

import SwiftUI
import ToastKit

@main
struct ToastKitDemoApp: App {
    @StateObject var toastManager = ToastManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toastManager)
        }
    }
}
