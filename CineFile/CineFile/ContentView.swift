//
//  ContentView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 28/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOnBoarding: Bool = false
    
    var body: some View {
        if(!isOnBoarding) { OnboardingView(isOnboarding: $isOnBoarding) }
    }
}

#Preview {
    ContentView()
}
