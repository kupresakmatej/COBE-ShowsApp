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
    
    private var defaultSearch = "drama"

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBlack")
                
                ScrollView {
                    ForEach(viewModel.shows, id: \.self) { show in
                        NavigationLink {
                            Text("Details view")
                        } label: {
                            SearchListElement(show: show, viewModel: viewModel)
                        }
                    }
                }
            }
            .background(Color("PrimaryDarkGray"))
            .toolbarBackground(Color("PrimaryDarkGray"), for: .navigationBar)
            .toolbar {
                HStack {
                    SearchBar(searchText: $searchText)
                        .foregroundColor(Color("PrimaryBlack"))
                    
                    Button() {
                        viewModel.fetchData(query: searchText)
                    } label: {
                        Image(systemName: "arrow.right.square.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding()
                            .foregroundColor(Color("PrimaryYellow"))
                    }
                }
            }
        }
        .foregroundColor(Color("PrimaryWhite"))
        .onAppear {
            viewModel.fetchData(query: defaultSearch)
        }
//        .onChange(of: searchText) { newSearchText in
//            viewModel.fetchData(query: newSearchText)
//        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
