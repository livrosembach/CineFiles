//
//  ProfileView.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 30/05/25.
//

import SwiftUI
import Charts

struct ProfileView: View {
    @Binding var MovieData: [MovieModel]
    @State private var searchText = ""
    
    var favoritesList: Double
    var watchedList: Double
    var countMovies: Double
    
    init(MovieData: Binding<[MovieModel]>) {
        self._MovieData = MovieData
        self.countMovies = Double(MovieData.wrappedValue.count)
        self.favoritesList = Double(MovieData.wrappedValue.filter { $0.isFavorite }.count)
        self.watchedList = Double(MovieData.wrappedValue.filter { $0.isWatched }.count)
    }
    
    var favoritePercentage: Double {
        guard countMovies > 0 else { return 0 }
        return (favoritesList / countMovies) * 100
    }
    
    var watchedPercentage: Double {
        guard countMovies > 0 else { return 0 }
        return (watchedList / countMovies) * 100
    }

    var body: some View {
        ZStack {
            VStack {
                HeaderView(logo:"logo-sm-pink",searchText: $searchText, showSearch: false)

                
                ScrollView {
                    VStack(spacing: 20) {
                        Image("user-profile")
                            .resizable()
                            .frame(width: 160, height: 160)
                        
                        profileField(label: "Nome", value: "Jane Doe")
                        profileField(label: "Email", value: "jane@example.com")
                        profileField(label: "Email", value: "jane@example.com")
                        profileField(label: "Data de nascimento", value: "05/05/2005")
                        
                        Spacer()
                       
                            VStack(spacing: 20) {
                                HStack{
                                    Text("Assistidos")
                                        .font(.title2).bold()
                                        .foregroundColor(Color("AppGreen"))
                                    Spacer()
                                    Text("\(Int(watchedList))/\(Int(countMovies))")
                                        .foregroundColor(.white).bold()
                                }

                                GaugeView(value: watchedPercentage, color: Color("AppGreen"))
                                    .padding(.top, -10)
                            
                                HStack{
                                    Text("Favoritos")
                                        .font(.title2).bold()
                                        .foregroundColor(Color("AppYellow"))
                                    Spacer()
                                    Text("\(Int(favoritesList))/\(Int(countMovies))")
                                        .foregroundColor(.white).bold()
                                }

                                GaugeView(value: favoritePercentage, color: Color("AppYellow"))
                                    .padding(.top, -10)
                           
                        }
                        
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
    }
    
    @ViewBuilder
    func profileField(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.headline)
                .foregroundStyle(.gray)
            Spacer()
            Text(value)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
    }
}


#Preview {
    MainView()
}
