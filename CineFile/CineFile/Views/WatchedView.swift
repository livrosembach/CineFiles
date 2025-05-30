//
//  WatchedView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct WatchedView: View {
    
    var movieList: [MovieModel] = MovieModel.movieData
    
    var body: some View {
        ZStack{
            VStack(){
                HeaderView(logo: "logo-sm-orange")
                ScrollView{
                    MainMovieGradientView()
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Assistidos")
                            .font(.system(size: 20, weight: .bold))
                            .fontWidth(.expanded)
                            .foregroundStyle(.white)
                       ForEach(movieList){ movie in
                            MovieCard(movie: movie, isFavorite: true, isWatched: true)
                        }
                    }.padding()
                }
                
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        }
    }
}

#Preview {
    WatchedView()
}

