//
//  RootView.swift
//  wingly
//
//  Created by Амина Алеева on 06.11.2024.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: TabItems = .home
    
    // MARK: – Fix for non-transparent default TabBar behaviour
    
    init() {
        let transparentAppearence = UITabBarAppearance()
        transparentAppearence.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = transparentAppearence
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                FeedView()
                    .tag(0)
               
                FeedView()
                    .tag(1)
               
                FeedView()
                    .tag(2)

                FeedView()
                    .tag(3)

                FeedView()
                    .tag(4)
            }
            
            ZStack {
                VStack {
                    FeedViewHeader()
                    
                    Spacer()
                    
                    HStack {
                        ForEach((TabItems.allCases), id: \.self) { item in
                            Button {
                                selectedTab = item
                            } label: {
                                customTabItem(tabItem: item, isActive: selectedTab == item)
                            }
                            
                            if item != TabItems.allCases.last {
                                Spacer()
                            }
                        }
                    }
                    .padding(.all, 8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(200)
                    .padding(.horizontal, 30)
                }
            }
        }
    }
}

extension RootView {
    func customTabItem(tabItem: TabItems, isActive: Bool) -> some View {
        Image(uiImage: UIImage(named: tabItem.iconName)!)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .padding(.all, 10)
            .background(isActive ? tabItem.activeBackgroundColor : tabItem.inactiveBackgroundColor)
            .cornerRadius(22)
    }
}
