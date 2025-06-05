//
//  WatchedView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct WatchedView: View {
    @Binding var movieList: [MovieModel]
    @State private var searchText: String = ""
    
    var filteredMoviesIndices: [Int] {
        movieList.indices.filter { index in
            let movie = movieList[index]
            let matchesSearch = searchText.isEmpty || movie.title.localizedCaseInsensitiveContains(searchText)
            let isWatched = movie.isWatched
            return matchesSearch && isWatched
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HeaderView(logo: "logo-sm-green", searchText: $searchText)
                    
                    ScrollView {
                        if searchText.isEmpty {
                            MainMovieGradientView(filter: .watched, MovieData: $movieList)
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(filteredMoviesIndices, id: \.self) { index in
                                NavigationLink {
                                    DetailView(movie: $movieList[index])
                                } label: {
                                    MovieCard(movie:  $movieList[index])
                                }
                            }
                        }
                        .animation(.default, value: searchText)
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
            }
        }
    }
}

