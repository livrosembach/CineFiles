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
    
    let randomNumber: Int = Int.random(in: 1...1000)
    
    func resetForm() {
        email = ""
        password = ""
        passwordConfirmation = ""
        dateOfBirthInt = 0
        age = 0
    }
    
    var dateOfBirth: Date {
        Date(timeIntervalSince1970: TimeInterval(dateOfBirthInt * 86400))
    }
    
    var valid: Bool {
        if (email.isEmpty || password.isEmpty || passwordConfirmation.isEmpty) {
            return false
        }
        if(password != passwordConfirmation) {
            return false
        }
        
        // Verificar idade do usuário
        if(Int(dateOfBirth.timeIntervalSinceNow / -31536000) != age) {
            return false
        }
        
        // Senha não contem o nome do binder
        if(!email.contains("Binder")) {
            return false
        }
        
        // Numero aleatorio
        if(!password.contains(String(randomNumber))) {
            return false
        }
        
        // Data de aniversario
        if(!email.contains(dateOfBirth.formatted(date: .numeric, time: .omitted))) {
            return false
        }
        
        return true
    }
    
    var errorMessage: String {
        if (email.isEmpty || password.isEmpty || passwordConfirmation.isEmpty) {
            return "Preencha todos os campos"
        }
        if(password != passwordConfirmation) {
            return "As senhas não coincidem"
        }
        
        // Verificar idade do usuário
        if(Int(dateOfBirth.timeIntervalSinceNow / -31536000) != age) {
            return "Sua idade está incorreta"
        }
        
        if(!email.contains("Binder")) {
            return "Você nao tem \"Binder\" no seu email"
        }
        
        // Numero aleatorio
        if(!password.contains(String(randomNumber))) {
            return "Sua senha nao tem o numero \(randomNumber)"
        }
        
        // Nao tem seu aniversario
        if(!email.contains(dateOfBirth.formatted(date: .numeric, time: .omitted))) {
            return "Voce nao tem seu aniversario \"\(dateOfBirth.formatted(date: .numeric, time: .omitted))\" no seu email"
        }
        
        return ""
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
                        .padding(.bottom, 20)
                    
                    VStack(spacing: 8) { // Conteudo LOGIN
                        Text("Cadastro")
                            .font(.system(size: 32, weight: .heavy))
                            .foregroundStyle(Color(.text))
                        
                        if (!errorMessage.isEmpty) {
                            Text("**Erro**: \(errorMessage)")
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.red))
                                .multilineTextAlignment(.center)
                        }
                        
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
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
                                
                                    Text("Senha")
                                        .font(.system(size: 16))
                                        .bold()
                                        .foregroundStyle(Color(.text))
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
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Confirmar Senha")
                                            .font(.system(size: 16))
                                            .bold()
                                            .foregroundStyle(Color(.text))
                                        SecureField(
                                            "Confirme sua senha",
                                            text: $passwordConfirmation,
                                            prompt: Text("Confirme sua senha").foregroundColor(Color(.white).opacity(0.5))
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
                                        Text("Data de nascimento: \(dateOfBirth.formatted(date: .numeric, time: .omitted))")
                                            .font(.system(size: 16))
                                            .bold()
                                            .foregroundStyle(Color(.text))
                                        Slider(
                                            value: $dateOfBirthInt,
                                            in: 0...22000
                                        )
                                        .tint(Color(.appYellow))
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
                                        .tint(Color(.appYellow))
                                        .foregroundStyle(Color(.text))
                                    }
                                
                            }
                        }
                        .frame(maxHeight: 300)
                        .padding(.vertical, 16)
                        .scrollIndicators(.visible)
                        
                        Button {
                            resetForm()
                        } label: {
                            Text("Resetar campos")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color(.background))
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(valid ? Color(.appYellow) : Color(.systemGray))
                                .cornerRadius(8)
                        }
                        .disabled(!valid)
                        .opacity(valid ? 1 : 0.3)
                        .alert("Parabéns", isPresented: $showingAlert) {
                            Button("Deletar conta", role: .cancel) {}
                        } message: {
                            Text("Você foi cadastrado no CineFilés")
                                .foregroundStyle(Color(.black))
                        }
                        
                        Button {
                            showingAlert = true
                        } label: {
                            Text("Finalizar cadastro")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(.white))
                                .padding(4)
                                .cornerRadius(8)
                        }
                        .disabled(!valid)
                        .opacity(valid ? 1 : 0.3)
                        .alert("Parabéns", isPresented: $showingAlert) {
                            Button("Deletar conta", role: .cancel) {}
                        } message: {
                            Text("Você foi cadastrado no CineFilés")
                                .foregroundStyle(Color(.black))
                        }
                        
                        NavigationLink {
                            LoginView().navigationBarBackButtonHidden()
                        } label: {
                            HStack(spacing: 4) {
                                Text("Já tem uma conta?")
                                    .font(.system(size: 18, weight: .regular))
                                    .padding(.top, 16)
                                    .foregroundStyle(Color(.text))
                                
                                Text("Entre agora")
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

#Preview {
    RegisterView()
}
