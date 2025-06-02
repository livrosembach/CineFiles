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

    var filteredMovies: [MovieModel] {

        let watchedOnly = movieList.filter { $0.isWatched == true }

        if searchText.isEmpty {
            return watchedOnly
        } else {
            return watchedOnly.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
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
                            ForEach(filteredMovies) { movie in
                                if let index = movieList.firstIndex(where: { $0.id == movie.id }) {
                                    MovieCard(movie: $movieList[index])
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

