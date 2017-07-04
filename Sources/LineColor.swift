//
//  ParsedLineColorRecord.swift
//  TPGSwift
//
//  Created by Yannick Heinrich on 11.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation
// MARK: - Color

#if os(iOS)
    import UIKit
    public typealias Color = UIColor
#elseif os(macOS)
    import Cocoa
    public typealias Color = NSColor
#endif

public enum ColorError: Error {
    case invalidRGBString(String)
    case scanError
}

fileprivate func color(rgba: String) throws -> Color {
    var red:   CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue:  CGFloat = 0.0
    var alpha: CGFloat = 1.0

    let index   = rgba.characters.index(rgba.startIndex, offsetBy: 1)
    let hex     = rgba.substring(from: index)
    let scanner = Scanner(string: hex)
    var hexValue: CUnsignedLongLong = 0
    if scanner.scanHexInt64(&hexValue) {
        switch (hex.characters.count) {
        case 3:
            red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
            green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
            blue  = CGFloat(hexValue & 0x00F)              / 15.0
        case 4:
            red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
            green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
            blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
            alpha = CGFloat(hexValue & 0x000F)             / 15.0
        case 6:
            red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
            green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
            blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
        case 8:
            red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
            blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
            alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
        default:
            throw ColorError.invalidRGBString(rgba)
        }
    } else {
        throw ColorError.scanError
    }
    return Color(red:red, green:green, blue:blue, alpha:alpha)
}

// MARK: - LineColor
/// LineColor represents an API line color object.
public struct LineColor: Decodable, APIObject {
    public static var recordName = "colors"

    public let hexa: Color
    public let code: String
    public let background: Color
    public let text: Color

    public enum CodingKeys: String, CodingKey {
        case hexa
        case code = "lineCode"
        case background
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hexaString = try container.decode(String.self, forKey: .hexa)
        let backgroundString = try container.decode(String.self, forKey: .background)
        let textString = try container.decode(String.self, forKey: .text)

        self.code = try container.decode(String.self, forKey: .code)
        self.hexa = try color(rgba: hexaString)
        self.background = try color(rgba: backgroundString)
        self.text = try color(rgba: textString)
    }
}

