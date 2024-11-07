//
//  FeedView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

private extension CGFloat {
    static let headerHeight: CGFloat = 88
    static let tabBarHeight: CGFloat = 60
    static let basePadding: CGFloat = 16
    
    // TODO: Replace with iOS GeometryReader
    static let topSafeArea: CGFloat = 44
    static let bottomSafeArea: CGFloat = 44
}

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                FeedPostView()
                
                FeedPostWithRepost()
                    .padding(.top, 10)
            }
            .padding(.top, .topSafeArea)
            .padding(.top, .headerHeight)
            .padding(.top, .basePadding)
            .padding(.horizontal, .basePadding)
            .padding(.bottom, .basePadding)
            .padding(.bottom, .tabBarHeight)
            .padding(.bottom, .bottomSafeArea)
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    FeedView()
}
