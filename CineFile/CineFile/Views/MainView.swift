//
//  MainView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 29/05/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var selectedColor: Color {
        switch selectedTab {
        case 0: return Color("BlueColor")
        case 1: return Color("YellowColor")
        case 2: return Color("GreenColor")
        case 3: return Color("PinkColor")
        default: return .accentColor
        }
    }
    
    init() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor.background
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView()
                .tabItem {
                    Label("Filmes", systemImage: "movieclapper")
                        .environment(\.symbolVariants, .none)
                }
                .tag(0)
            
            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                        .environment(\.symbolVariants, .none)
                }
                .tag(1)
            
            WatchedView()
                .tabItem {
                    Label("Assistidos", systemImage: "checkmark.arrow.trianglehead.counterclockwise")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person")
                        .environment(\.symbolVariants, .none)
                }
                .tag(3)
        }
        .tint(selectedColor)

    }
}

#Preview {
    MainView()
}

