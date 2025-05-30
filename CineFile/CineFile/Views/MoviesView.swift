//
//  MoviesView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 29/05/25.
//

import SwiftUI

struct MoviesView: View {
    @Binding var movieList: [MovieModel]
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack(){
                    HeaderView(logo: "logo-sm-blue")
                    
                    ScrollView{
                        MainMovieGradientView()
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("Todos os filmes")
                                .font(.system(size: 20, weight: .bold))
                                .fontWidth(.expanded)
                                .foregroundStyle(.white)
                            ForEach($movieList){ $movie in
                                MovieCard(movie: $movie)
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
