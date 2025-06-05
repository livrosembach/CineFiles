//
//  MainMovieGradient.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

enum MovieFilter {
    case all
    case favorites
    case watched
}

struct MainMovieGradientView: View {
    
    @Binding var MovieData: [MovieModel]
    let filter: MovieFilter
    let MovieImage: String?
    let MovieColor: Color?
    
    init(filter: MovieFilter, MovieData: Binding<[MovieModel]>) {
        self.filter = filter
        self._MovieData = MovieData
        
        let filteredMovies: [MovieModel]
        switch filter {
        case .favorites:
            filteredMovies = MovieData.wrappedValue.filter { $0.isFavorite }
        case .watched:
            filteredMovies = MovieData.wrappedValue.filter { $0.isWatched }
        case .all:
            filteredMovies = MovieData.wrappedValue
        }

        if let randomMovie = filteredMovies.randomElement() {
            MovieImage = randomMovie.image
            MovieColor = randomMovie.gradientColor
        } else {
            MovieImage = nil
            MovieColor = nil
        }
    }
    
    var body: some View {
        if MovieImage == nil || MovieColor == nil {
            VStack(spacing: 16) {
                Spacer()
                Image(systemName: "film")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                Text(emptyMessage())
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        } else {
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Image(MovieImage!)
                        .resizable()
                        .frame(width: 200, height: 300)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 420)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [MovieColor!, .background]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

                Text(headerTitle())
                    .font(.system(size: 20, weight: .bold))
                    .fontWidth(.expanded)
                    .foregroundStyle(.white)
                    .padding(.leading) 
            }
        }
    }
    
    private func headerTitle() -> String {
        switch filter {
        case .favorites:
            return "Favoritos"
        case .watched:
            return "Assistidos"
        case .all:
            return "Todos os filmes"
        }
    }
    
    private func emptyMessage() -> String {
        switch filter {
        case .favorites:
            return "Nenhum filme favorito ainda"
        case .watched:
            return "Nenhum filme assistido ainda"
        case .all:
            return "Nenhum filme disponível"
        }
    }
}
