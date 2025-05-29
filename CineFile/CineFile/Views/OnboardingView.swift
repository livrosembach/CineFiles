//
//  OnboardingView.swift
//  CineFile
//
//  Created by Gustavo Benitez Frehse on 29/05/25.
//
import SwiftUI
struct OnboardingView: View {
    var body: some View {
        ZStack{
            Image("onboarding")
                .resizable()
                .ignoresSafeArea(.all)
                .scaledToFill()
                .background(Color.background)
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                Text("Descubra seus filmes favoritos")
            }
        }
    }
}

#Preview {
    OnboardingView()
}
