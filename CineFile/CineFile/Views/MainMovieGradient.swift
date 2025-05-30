//
//  MainMovieGradient.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct MainMovieGradientView: View {
    
    @State private var MovieImage: String = "everything_everywhere_all_at_once"
    @State private var MovieColor: String = "PinkColor"
    
    var body: some View {
                VStack{
                    Image(MovieImage)
                        .resizable()
                        .frame(width: 200, height: 300)
                }
                .frame(width: 400, height: 420)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(MovieColor), .background]), startPoint: .top, endPoint: .bottom)
                    )
        }
    }

#Preview {
    MainMovieGradientView()
}
