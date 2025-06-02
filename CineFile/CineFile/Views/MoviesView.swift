//
//  MoviesView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 29/05/25.
//

import SwiftUI

struct MoviesView: View {
    @Binding var movieList: [MovieModel]
    @State private var searchText: String = ""

    var filteredMovies: [MovieModel] {

        if searchText.isEmpty {
            return movieList
        } else {
            return movieList.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HeaderView(logo: "logo-sm-blue", searchText: $searchText)

                    ScrollView {
                        if searchText.isEmpty {
                            MainMovieGradientView(filter: .all, MovieData: $movieList)
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

