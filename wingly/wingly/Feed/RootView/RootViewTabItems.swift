//
//  RootViewTabItems.swift
//  wingly
//
//  Created by Амина Алеева on 07.11.2024.
//

import SwiftUI

enum TabItems: Int, CaseIterable {
    case home = 0
    case search
    case createPost
    case favorites
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .createPost:
            return "Create Post"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "tabbar1"
        case .search:
            return "tabbar2"
        case .createPost:
            return "tabbar3"
        case .favorites:
            return "tabbar4"
        case .profile:
            return "tabbar5"
        }
    }
    
    var inactiveBackgroundColor: Color {
        switch self {
        case .createPost:
            return Color(hex: "#E2FF9F")
        default:
            return Color(hex: "#EFEFEF4D")
        }
    }
    
    var activeBackgroundColor: Color {
        switch self {
        case .createPost:
            return Color(hex: "#D6F295")
        default:
            return Color(hex: "#F6F6F6")
        }
    }
}
