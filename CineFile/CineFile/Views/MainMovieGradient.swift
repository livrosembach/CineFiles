//
//  MainMovieGradient.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct MainMovieGradientView: View {
    let MovieImage: String
    let MovieColor: Color
    
    init () {
        let randomMovie: MovieModel = MovieModel.movieData[Int.random(in: 0...(MovieModel.movieData.count - 1))]
        MovieImage = randomMovie.image
        MovieColor  = randomMovie.gradientColor
    }
    
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
