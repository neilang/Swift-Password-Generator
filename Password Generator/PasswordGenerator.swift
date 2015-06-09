//
//  PasswordGenerator.swift
//  Password Generator
//
//  Created by Neil Ang on 9/06/2014.
//  Copyright (c) 2014 Neil Ang. All rights reserved.
//
import Foundation

extension Array {
    func randomItem() -> T? {
        let idx = Int(arc4random()) % count
        return self[idx]
    }
    
    // Could contain duplicates
    func randomItems(total: Int) -> [T] {
        var result: [T] = []
        for _ in (0..<total) {
            if let item = randomItem() {
                result += [item]
            }
        }
        return result
    }
    
    func shuffleItems() -> [T] {
        var newArray = self
        for i in (0..<newArray.count) {
            let j = Int(arc4random()) % newArray.count
            newArray.insert(newArray.removeAtIndex(j), atIndex: i)
        }
        return newArray
    }
}

extension String {
    func split(bySeparator: String) -> Array<String> {
        if bySeparator.characters.count < 1 {
            var items: [String] = []
            for c in self.characters {
                items.append(String(c))
            }
            return items
        }
        return self.componentsSeparatedByString(bySeparator)
    }
}

class PasswordGenerator {
    let lowercaseSet = "abcdefghijklmnopqrstuvwxyz".split("")
    let uppercaseSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
    let symbolSet    = "!@#$%^&*?".split("")
    let numberSet    = "0123456789".split("")
    
    var numbers   = 5
    var lowercase = 5
    var uppercase = 5
    var symbols   = 5
    
    func generate() -> String {
        var password: [String] = []
        password += lowercaseSet.randomItems(lowercase)
        password += uppercaseSet.randomItems(uppercase)
        password += numberSet.randomItems(numbers)
        password += symbolSet.randomItems(symbols)
        return password.shuffleItems().reduce("") { (a, b) -> String in a+b }
    }
}
