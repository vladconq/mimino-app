//
//  Product.swift
//  Mimino6
//
//  Created by Vladislav on 06.11.2021.
//

enum Product: String, CaseIterable {
    case donate_99
    case donate_179
    case donate_279
    case donate_379
    
    var desription: String {
        switch self {
        case .donate_99:
            return "99 ₽"
        case .donate_179:
            return "179 ₽"
        case .donate_279:
            return "279 ₽"
        case .donate_379:
            return "379 ₽"

        }
    }
}
