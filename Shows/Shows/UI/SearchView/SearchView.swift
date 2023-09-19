//
//  SearchView.swift
//  Shows
//
//  Created by Matej Kuprešak on 18.09.2023..
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBlack")
                
                ScrollView {
                    ForEach(viewModel.shows, id: \.self) { show in
                        NavigationLink {
                            Text("Details view")
                        } label: {
                            HStack {
                                Image(systemName: "globe")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                    .foregroundColor(Color("PrimaryWhite"))
                                    .padding()
                                
                                VStack {
                                    Text("\(show.name)")
                                        .font(.headline)
                                        .foregroundColor(Color("PrimaryWhite"))
                                    
                                    Text("\(viewModel.getDate(show: show))")
                                        .font(.subheadline)
                                        .foregroundColor(Color("PrimaryLightGray"))
                                    
                                    Text("\(show.genres.joined(separator: ", "))")
                                        .font(.subheadline)
                                        .foregroundColor(Color("PrimaryLightGray"))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .scaledToFit()
                                    .foregroundColor(Color("PrimaryLightGray"))
                                    .padding()
                            }
                        }
                    }
                }
            }
            .background(Color("PrimaryDarkGray"))
            .toolbarBackground(Color("PrimaryDarkGray"), for: .navigationBar)
        }
        .searchable(text: $searchText)
        .foregroundColor(Color("PrimaryWhite"))
        .onAppear {
            viewModel.fetchData(query: "drama")
        }
        .onChange(of: searchText) { newSearchText in
            viewModel.fetchData(query: newSearchText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
