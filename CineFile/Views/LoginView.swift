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
    
    @State private var showPassword: Bool = false
    
    @State private var showMainView: Bool = false
    private var valid: Bool {
        if (email.isEmpty || password.isEmpty) {
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationStack {
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
                            .tint(Color(.appYellow))
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
                            
                            if(showPassword) {
                                TextField(
                                    "Insira sua senha",
                                    text: $password,
                                    prompt: Text("Insira sua senha").foregroundColor(Color(.white).opacity(0.5))
                                )
                                .tint(Color(.appYellow))
                                .foregroundStyle(Color(.text))
                                .padding(12)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 1)
                                        .overlay {
                                            HStack {
                                                Spacer()
                                                Button {
                                                    withAnimation {
                                                        showPassword = false
                                                    }
                                                } label: {
                                                    Image(systemName: "eye.fill")
                                                        .foregroundColor(.white)
                                                }
                                                .padding(12)
                                            }
                                        }
                                }
                            } else {
                                SecureField(
                                    "Insira sua senha",
                                    text: $password,
                                    prompt: Text("Insira sua senha").foregroundColor(Color(.white).opacity(0.5))
                                )
                                .tint(Color(.appYellow))
                                .foregroundStyle(Color(.text))
                                .padding(12)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 1)
                                        .overlay {
                                            HStack {
                                                Spacer()
                                                Button {
                                                    withAnimation {
                                                        showPassword = true
                                                    }
                                                } label: {
                                                    Image(systemName: "eye.slash.fill")
                                                        .foregroundColor(.white)
                                                }
                                                .padding(12)
                                            }
                                        }
                                }
                            }
                        }
                        
                        
                        Button {
                            if (valid) {
                                showMainView = true
                            }
                        } label: {
                            Text("Login")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color(.background))
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(valid ? Color(.appYellow) : Color(.systemGray))
                                .cornerRadius(8)
                        }
                        .opacity(valid ? 1 : 0.5)
                        .disabled(!valid)
                        .fullScreenCover(isPresented: $showMainView) {
                            MainView()
                        }
                        
                        Button {
                            showMainView = true
                        }
                        label: {
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
                        
                        NavigationLink {
                            RegisterView().navigationBarBackButtonHidden()
                        } label: {
                            HStack {
                                Text("Não tem uma conta?")
                                    .font(.system(size: 18, weight: .regular))
                                    .padding(.top, 16)
                                    .foregroundStyle(Color(.text))
                                
                                Text("Cadastre-se")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.top, 16)
                                    .foregroundStyle(Color(.appYellow))
                                    .underline()
                            }
                        }
                        
                        
                    }
                    .padding(24)
                    .padding(.bottom, 32)
                    .background(Color(.background.opacity(0.5)))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
