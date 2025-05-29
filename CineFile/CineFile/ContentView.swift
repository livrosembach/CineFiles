//
//  ContentView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 28/05/25.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut(duration: 0.3), value: isShowing)
        .background(Color.background)
    }
}

struct ContentView: View {
    @State private var isLoading: Bool = true
    @State private var isOnBoarding: Bool = false
    
    var body: some View {
        ZStack {
            if isLoading {
                LoadingView(isShowing: $isLoading)
            } else if !isOnBoarding {
                OnboardingView(isOnboarding: $isOnBoarding)
                
            } else {
                MainView()
            }
        }
        .onAppear {
            // Simula um carregamento inicial de 2 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
