//
//  DetailView.swift
//  CineFile
//
//  Created by Gustavo Benitez Frehse on 30/05/25.
//

import SwiftUI
struct DetailView: View {
    
    @Binding var movie: MovieModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 16) {
                    Image(movie.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: (UIScreen.main.bounds.width / 2))
                        .cornerRadius(4)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .bold))
                        Text("234 minutos")
                            .foregroundStyle(.white.opacity(0.75))
                            .font(.system(size: 16, weight: .bold))
                        Text("Ano: \(movie.year)")
                            .foregroundStyle(.white.opacity(0.75))
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 120)
                .padding(.bottom, 32)
                .frame(maxWidth: .infinity)
                .background {
                    ZStack {
                        Image(movie.image)
                            .resizable()
                            .scaledToFill()
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color.background.opacity(0.75), location: 0.0),
                                Gradient.Stop(color: Color.background, location: 1),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    }
                }
                .clipShape(.rect)
                
                VStack(alignment: .leading) {
                    HStack {
                        /// Botao: FAVORITAR OU DESFAVORITAR
                        Button{
                            withAnimation {
                                movie.isFavorite.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: "star.circle.fill")
                                Text(movie.isFavorite ? "Favorito" : "Favoritar")
                            }
                            .foregroundStyle(Color(movie.isFavorite ? .background : Color("AppYellow")))
                            .bold()
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                        }
                        .tint(Color(movie.isFavorite ? Color("AppYellow") : .gray.opacity(0.1)))
                        .buttonStyle(.borderedProminent)
                        
                        /// Botao: ASSISTIDO ou NAO ASSISTIDO
                        Button{
                            withAnimation {
                                movie.isWatched.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: "eye.fill")
                                Text(movie.isWatched ? "Assistido" : "Não assistido")
                            }
                            .foregroundStyle(Color(movie.isWatched ? .background : .white))
                            .bold()
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                        }
                        .tint(Color(movie.isWatched ? Color("AppGreen") : .gray.opacity(0.1)))
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Text("Sinopse")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color(.green))
                        .padding(.top, 16)
                    Text(movie.synopsis)
                    
                    Text("Direção")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color(.green))
                        .padding(.top, 16)
                    Text(movie.directing)
                    
                    Text("Roteiristas")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color(.green))
                        .padding(.top, 16)
                    Text(movie.screenwriters)
                }
                .padding(.horizontal, 16)
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .frame(minHeight: UIScreen.main.bounds.height, alignment: .top)
        .padding(.bottom, 32)
        .background(Color(.background))
        .foregroundStyle(.white)
    }
}

#Preview {
    @Previewable @State var movie: MovieModel = MovieModel(
        title: "Os Serviços de Entrega da Kiki",
        year: "1990",
        synopsis: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.",
        directing: "Hayao Miyazaki",
        screenwriters: "Hayao Miyazaki, Jack Fletcher, John Semper",
        image: "kikis_delivery_service",
        gradientColor: .red
    )
    DetailView(movie: $movie)
}
