//
//  Font+Lora.swift
//  prime
//
//  Created by GPT on 11/14/25.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

enum LoraFontWeight: String {
    case regular = "Regular"
    case medium = "Medium"
    case semiBold = "SemiBold"
    case bold = "Bold"
    
#if canImport(UIKit)
    var systemWeight: UIFont.Weight {
        switch self {
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .semiBold:
            return .semibold
        case .bold:
            return .bold
        }
    }
#endif
    
    var fontWeight: Font.Weight {
        switch self {
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .semiBold:
            return .semibold
        case .bold:
            return .bold
        }
    }
}

extension Font {
    static func lora(_ size: CGFloat, weight: LoraFontWeight = .regular) -> Font {
#if canImport(UIKit)
        let fontName = "Lora-\(weight.rawValue)"
        if UIFont(name: fontName, size: size) != nil {
            return Font.custom(fontName, size: size)
        } else {
            return .system(size: size, weight: weight.fontWeight, design: .serif)
        }
#else
        return .system(size: size, weight: weight.fontWeight, design: .serif)
#endif
    }
}


