//
//  FeedView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                HStack {
                    Image(uiImage: UIImage(named: "bell")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.top, 20)
                }
                .opacity(0)
                .padding(.leading, 100)
                
                Image(uiImage: UIImage(named: "Logo_start")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 20)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(uiImage: UIImage(named: "bell")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.top, 20)
                    }
                }
                .padding(.leading, 100)
            }
            
            ZStack {
                ScrollView {
                    FeedPostView()
                }
                .scrollIndicators(.hidden)
                .frame(height: 730)
                
                
                Spacer()
                
                TabBarView()
            }
        }
    }
}

#Preview {
    FeedView()
}
