//
//  Area.swift
//  weather
//
//  Created by 宇山拓夢 on 2019/04/08.
//  Copyright © 2019 宇山拓夢. All rights reserved.
//

import Foundation

// 学習のためEnumにしている
enum Area: Int {
    case TOKYO = 130010
    case OHSHIMA = 130020
    case HACHIJOJIMA = 130030
    case CHICHIJIMA = 130040
    case YOKOHAMA = 140010
    case ODAWARA = 140020
    
    var name: String {
        switch self {
        case .TOKYO:
            return "東京都東京"
        case .OHSHIMA:
            return "東京都大島"
        case .HACHIJOJIMA:
            return "東京都八丈島"
        case .CHICHIJIMA:
            return "東京都父島"
        case .YOKOHAMA:
            return "神奈川県横浜"
        case .ODAWARA:
            return "神奈川県小田原"
        }
    }
}
