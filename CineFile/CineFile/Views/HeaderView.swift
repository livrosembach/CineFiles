//
//  HeaderView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//


import SwiftUI

struct HeaderView: View {
    @State var logo: String = "logo"
    var body: some View {
        
            VStack{
                HStack(){
                    Image(logo)
                        .resizable()
                        .frame(width: 60, height: 40)
                            
                            
                    Spacer()
                        Image(systemName: "magnifyingglass")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                }
            }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .padding(10)
                .background(Color.background)
                
        
    }
}

#Preview {
    HeaderView()
}
