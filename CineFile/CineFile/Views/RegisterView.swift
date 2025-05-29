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
    @State private var passwordConfirmation: String = ""
    @State private var dateOfBirthInt: Double = 0
    @State private var age: Int = 0
    @State private var showingAlert: Bool = false
    
    var dateOfBirth: Date {
        Date(timeIntervalSince1970: TimeInterval(dateOfBirthInt * 86400))
    }
    
    var valid: Bool {
        if (email.isEmpty || password.isEmpty || passwordConfirmation.isEmpty) { return false }
        if(password != passwordConfirmation) { return false}
        
        // Verificar idade do usuário
        if(Int(dateOfBirth.timeIntervalSinceNow / -31536000) != age) {
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
                    
                    VStack(spacing: 8) { // Conteudo LOGIN
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
                            Text("Confirmar Senha")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundStyle(Color(.text))
                            TextField(
                                "Insira sua senha",
                                text: $passwordConfirmation,
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
                            Text("Data de nascimento: \(dateOfBirth.formatted(date: .numeric, time: .omitted))")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundStyle(Color(.text))
                            Slider(
                                value: $dateOfBirthInt,
                                in: 0...22000
                            )
                            .tint(Color(.yellow))
                            .foregroundStyle(Color(.text))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Data de nascimento")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundStyle(Color(.text))
                            
                            Stepper(value: $age, in: 0...120) {
                                Text("Sua idade é \(age)")
                            }
                            .tint(Color(.yellow))
                            .foregroundStyle(Color(.text))
                        }
                        
                        Button {
                            showingAlert = true
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
                        .alert("Parabéns", isPresented: $showingAlert) {
                            Button("Deletar conta", role: .cancel) { }
                                .backgroundStyle(.black)
                        } message: {
                            Text("Você foi cadastrado no CineFilés")
                                .foregroundStyle(Color(.black))
                        }
                        
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
