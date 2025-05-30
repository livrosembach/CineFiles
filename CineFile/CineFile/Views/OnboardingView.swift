//
//  OnboardingView.swift
//  CineFile
//
//  Created by Gustavo Benitez Frehse on 29/05/25.
//
import SwiftUI
struct OnboardingView: View {
    @Binding var isOnboarding: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("onboarding")
                    .resizable()
                    .ignoresSafeArea(.all)
                    .scaledToFill()
                    .background(Color.background)
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    
                    /// Logo do CINEFILES
                    HStack{
                        Image("logo")
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    /// Titulo
                    Text("Descubra seus filmes favoritos")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundStyle(Color(.text))
                    
                    /// Descricao
                    Text("Veja e descubra filmes incríveis que você nunca viu antes, favorite eles e adicione novos no catálogo")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundStyle(Color(.text))
                    
                    /// Botao: proxima tela
                    ///
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            HStack {
                                Text("Começar")
                                Image(systemName: "chevron.forward")
                            }
                            .font(.system(size: 18, weight: .heavy))
                            .foregroundStyle(Color(.background))
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(Color(.yellow))
                            .cornerRadius(8)
                            .onTapGesture {
                                withAnimation {
                                    isOnboarding = true
                                }
                            }
                        }
                    )
                    
                }
                .padding(24)
                .padding(.bottom, 36)
            }
        }
    }
}

#Preview {
    @Previewable @State var isOnboarding: Bool = false
    OnboardingView(isOnboarding: $isOnboarding)
}
