//
//  AppDelegate.swift
//  Calculator
//
//  Created by Lukas Möller on 05.06.19.
//  Copyright © 2019 Lukas Möller. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered, defer: false)
        //window.titlebarAppearsTransparent = true
        window.center()
        window.setFrameAutosaveName("Main Window")

        let hostingView = NSHostingView(rootView: ContentView())
        window.contentView = hostingView
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

