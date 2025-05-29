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
        case 0: return .accentColor
        case 1: return .orange
        case 2: return .blue
        case 3: return .pink
        default: return .accentColor
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

            MoviesView()
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                        .environment(\.symbolVariants, .none)
                }
                .tag(1)

            MoviesView()
                .tabItem {
                    Label("Assistidos", systemImage: "checkmark.arrow.trianglehead.counterclockwise")
                }
                .tag(2)
            
            MoviesView()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
                .tag(3)
        }
        .tint(selectedColor)
    }
}

