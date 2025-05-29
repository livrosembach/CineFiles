//
//  LoginView.swift
//  CineFile
//
//  Created by Gustavo Benitez Frehse on 29/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Image("onboarding")
                .resizable()
                .ignoresSafeArea(.all)
                .scaledToFill()
                .background(Color.background)
            
            VStack{
                Spacer()
                
                Image("logo") // Logo CINEFILES
                
                Spacer()
                
                VStack(spacing: 20) { // Conteudo LOGIN
                    Text("Login")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundStyle(Color(.text))
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(Color(.text))
                        TextField(
                            "Insira seu e-mail",
                            text: $email,
                            prompt: Text("Insira seu e-mail").foregroundColor(Color(.white).opacity(0.5))
                        )
                        .tint(Color(.yellow))
                        .foregroundStyle(Color(.text))
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Senha")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(Color(.text))
                        SecureField(
                            "Insira sua senha",
                            text: $password,
                            prompt: Text("Insira sua senha").foregroundColor(Color(.white).opacity(0.5))
                        )
                        .tint(Color(.yellow))
                        .foregroundStyle(Color(.text))
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                                .overlay {
                                    HStack {
                                        Spacer()
                                        Button {} label: {
                                            Image(systemName: "eye.fill")
                                                .foregroundColor(.white)
                                        }
                                        .padding(12)
                                    }
                                }
                        }
                    }
                    
                    Button {} label: {
                        Text("Login")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color(.background))
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(Color(.yellow))
                            .cornerRadius(8)
                    }
                    
                    Button {} label: {
                        HStack {
                            Image(systemName: "apple.logo")
                            Text("Entre com a Apple")
                        }
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(8)
                    }
                    .padding(.top, 16)
                    
                    HStack{
                        Text("Não tem uma conta?")
                            .font(.system(size: 18, weight: .regular))
                            .padding(.top, 16)
                            .foregroundStyle(Color(.text))
                        
                        Text("Cadastre-se")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.top, 16)
                            .foregroundStyle(Color(.yellow))
                            .underline()
                    }
                }
                .padding(24)
                .padding(.bottom, 32)
                .background {
                    Rectangle()
                        .foregroundColor(Color(.background))
                        .opacity(0.5)
                        .blur(radius: 10, opaque: true)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
