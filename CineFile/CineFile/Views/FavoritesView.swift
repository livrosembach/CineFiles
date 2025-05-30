//
//  FavoritesView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var movieList: [MovieModel]
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack(){
                    HeaderView(logo: "logo-sm-orange")
                    ScrollView{
                        MainMovieGradientView()
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("Favoritos")
                                .font(.system(size: 20, weight: .bold))
                                .fontWidth(.expanded)
                                .foregroundStyle(.white)
                            ForEach($movieList){ $movie in
                                if(movie.isFavorite == true){
                                    MovieCard(movie: $movie)
                                }
                            }
                        }.padding()
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
            }
        }
    }
}

