//
//  FavoritesView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var movieList: [MovieModel]
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HeaderView(logo: "logo-sm-orange", searchText: $searchText)

                    ScrollView {
                        if searchText.isEmpty {
                            MainMovieGradientView(filter: .favorites, MovieData: $movieList)
                        }

                        VStack(alignment: .leading, spacing: 20) {
                            ForEach($movieList) { $movie in
                                if ((searchText.isEmpty ||
                                    movie.title.localizedCaseInsensitiveContains(searchText))
                                    && movie.isFavorite) {
                                    
                                    NavigationLink {
                                        DetailView(movie: $movie)
                                    } label: {
                                        MovieCard(movie: $movie)
                                    }
                                    
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

