//
//  AppDelegate.swift
//  Password Generator
//
//  Created by Neil Ang on 8/06/2014.
//  Copyright (c) 2014 Neil Ang. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    let password = PasswordGenerator()
                            
    @IBOutlet var window: NSWindow
    @IBOutlet var passwordField : NSTextField

    @IBOutlet var lettersSlider  : NSSlider
    @IBOutlet var capitalsSlider : NSSlider
    @IBOutlet var numbersSlider  : NSSlider
    @IBOutlet var symbolsSlider  : NSSlider
    
    @IBOutlet var numbersField   : NSTextField
    @IBOutlet var lowercaseField : NSTextField
    @IBOutlet var uppercaseField : NSTextField
    @IBOutlet var symbolsField   : NSTextField

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        refreshPassword(self)
    }
    
    func applicationShouldHandleReopen(theApplication: NSApplication!,hasVisibleWindows flag: Bool) -> Bool {
        window.makeKeyAndOrderFront(self)
        return true
    }

    @IBAction func refreshPassword(sender : AnyObject) {
        password.lowercase = lettersSlider.integerValue
        password.uppercase = capitalsSlider.integerValue
        password.numbers   = numbersSlider.integerValue
        password.symbols   = symbolsSlider.integerValue

        lowercaseField.stringValue = lettersSlider.integerValue.description
        uppercaseField.stringValue = capitalsSlider.integerValue.description
        numbersField.stringValue   = numbersSlider.integerValue.description
        symbolsField.stringValue   = symbolsSlider.integerValue.description
        passwordField.stringValue  = password.generate()
    }
    
}

