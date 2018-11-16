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
    let startHour = 8, startMinute = 0, endHour = 22, endMinute = 0

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("night"))
            button.action = #selector(toggleMode(_:))
        }
        constructMenu()
        checkRange()
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
    
    func checkRange() {
        let calendar = Calendar.current
        let now = NSDate()
        let nowDateValue = now as Date
        let start = calendar.date(bySettingHour: startHour, minute: startMinute, second: 0, of: nowDateValue)
        let end = calendar.date(bySettingHour: endHour, minute: endMinute, second: 0, of: nowDateValue)
        if nowDateValue >= start! && nowDateValue <= end! {
            if(DarkMode.isEnabled) {
                DarkMode.toggle(force: false)
            }
        }else {
            if(!DarkMode.isEnabled) {
                DarkMode.toggle(force: true)
            }
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

