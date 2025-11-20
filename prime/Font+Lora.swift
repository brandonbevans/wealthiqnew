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
        return .system(size: size, weight: weight.fontWeight)
    }
}


