//
//  AppDelegate.swift
//  darkk
//
//  Created by Hugo Striedinger on 11/10/18.
//  Copyright © 2018 Hugo Striedinger. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("night"))
            button.action = #selector(toggleMode(_:))
        }
        constructMenu()
    }
    
    @objc func toggleMode(_ sender: Any?) {
        DarkMode.toggle()
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Toggle Mode", action: #selector(AppDelegate.toggleMode(_:)), keyEquivalent: "T"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

