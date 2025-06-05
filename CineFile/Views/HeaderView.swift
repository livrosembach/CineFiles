//
//  HeaderView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//


import SwiftUI

struct HeaderView: View {
    @State var logo: String = "logo"
    @Binding var searchText: String
    var showSearch: Bool = true 

    var body: some View {
        VStack {
            HStack {
                Image(logo)
                    .resizable()
                    .frame(width: 60, height: 40)
                
                Spacer()

                if showSearch {
                    TextField("Buscar filmes", text: $searchText)
                        .foregroundStyle(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                        )
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 12)
                            }
                        )
                        .accentColor(.white)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .padding(.horizontal, 10)
        .padding(.top, 10)
        .background(Color.background)
    }
}


