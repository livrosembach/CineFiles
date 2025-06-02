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
                            ForEach($movieList) { $movie in
                                if searchText.isEmpty || movie.title.localizedCaseInsensitiveContains(searchText) {
                                    MovieCard(movie: $movie, isFavorite: false, isWatched: true)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
            }
        }
    }
}

