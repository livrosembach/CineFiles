//
//  LoginView.swift
//  CineFile
//
//  Created by Gustavo Benitez Frehse on 29/05/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: Double = 0
    @State private var dateOfBirthInt: Int = 0
    
    var dateOfBirth: Date {
        Date(timeIntervalSince1970: TimeInterval(dateOfBirthInt * 86400))
    }
    
    var valid: Bool {
        if (email.isEmpty || password.isEmpty) {
            return false
        }
        
        if (Double(password) == nil || passwordConfirmation.rounded(.down) != Double(password)) {
            return false
        }
        
        return true
    }
    
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
                        Text("Cadastro")
                            .font(.system(size: 32, weight: .heavy))
                            .foregroundStyle(Color(.text))
                        
                        VStack(alignment: .leading) {
                            Text("Email")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundStyle(Color(.text))
                            SecureField(
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
                            TextField(
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
                        
                        VStack(alignment: .leading) {
                            Text("Confirmação de Senha (\(String(format: "%.0f", passwordConfirmation.rounded(.down))))")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundStyle(Color(.text))
                            Slider(
                                value: $passwordConfirmation,
                                in: 0...16384
                            )
                            .tint(Color(.yellow))
                            .foregroundStyle(Color(.text))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Data de nascimento")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundStyle(Color(.text))
                            
                            Stepper(value: $dateOfBirthInt, in: 0...100000) {
                                Text("\(dateOfBirth.formatted(date: .numeric, time: .omitted))")
                            }
                            .tint(Color(.yellow))
                            .foregroundStyle(Color(.text))
                        }
                        
                        Button {
                        } label: {
                            Text("Cadastrar")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color(.background))
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(valid ? Color(.yellow) : Color(.systemGray))
                                .cornerRadius(8)
                        }
                        .disabled(!valid)
                        .opacity(valid ? 1 : 0.3)
                        
                        HStack(spacing: 4) {
                            Text("Já tem uma conta?")
                                .font(.system(size: 18, weight: .regular))
                                .padding(.top, 16)
                                .foregroundStyle(Color(.text))
                            
                            Text("Entre agora")
                                .font(.system(size: 18, weight: .bold))
                                .padding(.top, 16)
                                .foregroundStyle(Color(.yellow))
                                .underline()
                        }
                    }
                    .padding(24)
                    .padding(.bottom, 32)
                    .background(Color(.background.opacity(0.5)))
                }
            }
    }
}

#Preview {
    RegisterView()
}
