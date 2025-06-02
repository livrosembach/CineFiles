//
//  MainView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 29/05/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    @State private var movieList: [MovieModel] = MovieModel.movieData
    
    var selectedColor: Color {
        switch selectedTab {
            case 0: return Color("AppBlue")
            case 1: return Color("AppYellow")
            case 2: return Color("AppGreen")
            case 3: return Color("AppPink")
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
            MoviesView(movieList: $movieList)
                .tabItem {
                    Label("Filmes", systemImage: "movieclapper")
                        .environment(\.symbolVariants, .none)
                }
                .tag(0)
            
            FavoritesView(movieList: $movieList)
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                        .environment(\.symbolVariants, .none)
                }
                .tag(1)
            
            WatchedView(movieList: $movieList)
                .tabItem {
                    Label("Assistidos", systemImage: "checkmark.arrow.trianglehead.counterclockwise")
                }
                .tag(2)
            
            ProfileView(MovieData: $movieList)
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

