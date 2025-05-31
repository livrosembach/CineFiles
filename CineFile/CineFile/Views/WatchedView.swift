//
//  WatchedView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct WatchedView: View {
    @Binding var movieList: [MovieModel]
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack(){
                    HeaderView(logo: "logo-sm-green")
                    ScrollView{
                        MainMovieGradientView(filter: .watched, MovieData: $movieList)
                        
                        VStack(alignment: .leading, spacing: 20){
                            ForEach($movieList){ $movie in
                                if(movie.isWatched == true){
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

