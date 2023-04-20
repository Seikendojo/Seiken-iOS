//
//  UIColorExtensions.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    static let skOrange = UIColor(red: 0.998, green: 0.622, blue: 0.005, alpha: 1.000)
    static let skGreen = UIColor(red: 0.594, green: 1.000, blue: 0.160, alpha: 1.000)
    static let skDarkGreen = UIColor(red: 99/255.0, green: 191/255.0, blue: 0/255.0, alpha: 1.000)
    static let skActivityGreen = UIColor(red: 150/255.0, green: 198/255.0, blue: 23/255.0, alpha: 1.000)
    static let skWhite = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    static let skBlue = UIColor(red: 0.157, green: 0.565, blue: 0.820, alpha: 1.000)
    static let skLightBlue = UIColor(red: 144/255.0, green: 202/255.0, blue: 249/255.0, alpha: 1.000)
    static let skLightGrey = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1.000)
    static let skDarkBlue = UIColor.skBlue.withBrightness(0.60)
    static let skDarkBlueTranslucent = UIColor.skDarkBlue.withAlpha(0.95)
    static let skBlackTranslucent = UIColor.black.withAlpha(0.20)
    static let skRed = UIColor(red: 207/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.000)
    static let skYellow = UIColor(red: 251/255.0, green: 177/255.0, blue: 69/255.0, alpha: 1.000)
    static let meeloOrange = UIColor(red: 254/255.0, green: 84/255.0, blue: 0/255.0, alpha: 1.000)
    
    func withHue(_ newHue: CGFloat) -> UIColor {
        var saturation: CGFloat = 1, brightness: CGFloat = 1, alpha: CGFloat = 1
        self.getHue(nil, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: newHue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    func withSaturation(_ newSaturation: CGFloat) -> UIColor {
        var hue: CGFloat = 1, brightness: CGFloat = 1, alpha: CGFloat = 1
        self.getHue(&hue, saturation: nil, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: hue, saturation: newSaturation, brightness: brightness, alpha: alpha)
    }
    func withBrightness(_ newBrightness: CGFloat) -> UIColor {
        var hue: CGFloat = 1, saturation: CGFloat = 1, alpha: CGFloat = 1
        self.getHue(&hue, saturation: &saturation, brightness: nil, alpha: &alpha)
        return UIColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
    }
    func withAlpha(_ newAlpha: CGFloat) -> UIColor {
        var hue: CGFloat = 1, saturation: CGFloat = 1, brightness: CGFloat = 1
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: newAlpha)
    }
    func highlight(withLevel highlight: CGFloat) -> UIColor {
        var red: CGFloat = 1, green: CGFloat = 1, blue: CGFloat = 1, alpha: CGFloat = 1
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * (1-highlight) + highlight, green: green * (1-highlight) + highlight, blue: blue * (1-highlight) + highlight, alpha: alpha * (1-highlight) + highlight)
    }
    func shadow(withLevel shadow: CGFloat) -> UIColor {
        var red: CGFloat = 1, green: CGFloat = 1, blue: CGFloat = 1, alpha: CGFloat = 1
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * (1-shadow), green: green * (1-shadow), blue: blue * (1-shadow), alpha: alpha * (1-shadow) + shadow)
    }
}
