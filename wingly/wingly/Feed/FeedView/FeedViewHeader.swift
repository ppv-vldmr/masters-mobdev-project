//
//  FeedViewHeader.swift
//  wingly
//
//  Created by Амина Алеева on 07.11.2024.
//

// TODO: This is a temporary Header for FeedView – replace with proper custom NavigationStack header when possible

import SwiftUI

enum FeedViewHeaderTab: Int, CaseIterable {
    case forYou = 0
    case recommendations
    
    var title: String {
        switch self {
        case .forYou:
            return "Для вас"
        case .recommendations:
            return "Рекомендации"
        }
    }
}

struct FeedViewHeader: View {
    
    @State var selectedTab: FeedViewHeaderTab = .forYou
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(uiImage: UIImage(named: "bell")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .opacity(0)
                
                Spacer()
                
                Image("Logo_start")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 82)
                    .padding(.top, 8)
                    .padding(.bottom, 3)
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(uiImage: UIImage(named: "bell")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            HStack(spacing: 20) {
                Button {
                    selectedTab = .forYou
                } label: {
                    customNavBarButton(tabItem: .forYou, isActive: selectedTab == .forYou)
                }
                                
                Button {
                    selectedTab = .recommendations
                } label: {
                    customNavBarButton(tabItem: .recommendations, isActive: selectedTab == .recommendations)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color(hex: "#82828233"))
        }
        .background(Color(uiColor: .systemBackground))
    }
}

extension FeedViewHeader {
    func customNavBarButton(tabItem: FeedViewHeaderTab, isActive: Bool) -> some View {
        HStack {
            Spacer()
            
            VStack(spacing: 0) {
                Text(tabItem.title)
                    .font(Font.custom("VelaSans-SemiBold", size: 16))
                    .foregroundStyle(isActive ? Color(hex: "#020202") : Color(hex: "#898989"))
                    .padding(.horizontal, 4)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(Color(red: 134 / 255, green: 93 / 255, blue: 230 / 255))
                    .cornerRadius(4)
                    .opacity(isActive ? 1 : 0)
                    .padding(.top, 8)
            }
            .fixedSize()
            
            Spacer()
        }
    }
}
