//
//  MovieCard.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct MovieCard: View {
    
    @State var movie: MovieModel
    @State var isFavorite: Bool
    @State var isWatched: Bool
    
    var body: some View {
        NavigationStack{
            NavigationLink{
                DetailView(movie: $movie)
            } label: {
                HStack{
                    Image(movie.image)
                        .resizable()
                        .frame(width: 120, height: 170)
                    VStack(alignment: .leading, spacing: 5){
                        Text(movie.title)
                            .font(.headline)
                            .foregroundStyle(Color.white)
                        Text(movie.year)
                            .font(.subheadline)
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                    HStack(){
                        if isFavorite{
                            Image(systemName: "star.circle.fill")
                                .foregroundStyle(Color("YellowColor"))
                        }
                        if isWatched{
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(Color("GreenColor"))
                        }
                    }
                }
            }
           
        }
    }
}

#Preview {
    MovieCard(movie: MovieModel(
        title: "Tudo em Todo o Lugar ao Mesmo Tempo",
        year: "2022",
        synopsis: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
        directing: "Daniel Kwan, Daniel Scheinert",
        screenwriters: "Daniel Kwan, Daniel Scheinert",
        image: "everything_everywhere_all_at_once",
        gradientColor: "linear-gradient(to right, #FFC0CB, #FF69B4)"
    ), isFavorite: true, isWatched: false)
}
