//
//  ContentView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 28/05/25.
//

import SwiftUI

struct LoadingView: View {
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
        .background(Color.background)
    }
}

struct ContentView: View {
    @State private var isLoading: Bool = true
    @State private var isOnBoarding: Bool = false
    
    var body: some View {
        ZStack {
            if isLoading {
                LoadingView()
                
            } else if !isOnBoarding {
                OnboardingView(isOnboarding: $isOnBoarding)
                
            } else {
                NavigationStack {
                    LoginView()
                }
            }
        }
        .background(Color.background)
        .onAppear {
            // Simula um carregamento inicial de 2 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.snappy(duration: 2)) {
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
