//
//  MovieCard.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI

struct MovieCard: View {
    @Binding var movie: MovieModel
    
    var body: some View {
        HStack{
            Image(movie.image)
                .resizable()
                .frame(width: 120, height: 170)
            VStack(alignment: .leading, spacing: 5){
                Text(movie.title)
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                Text(movie.year)
                    .font(.subheadline)
                    .foregroundStyle(Color.white)
            }
            Spacer()
            HStack(){
                if movie.isFavorite{
                    Image(systemName: "star.circle.fill")
                        .foregroundStyle(Color(.appYellow))
                }
                if movie.isWatched{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color("AppGreen"))
                }
            }
        }
    }
}
