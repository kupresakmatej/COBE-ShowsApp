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
        ZStack {
            Color("PrimaryBlack")
            
            VStack {
                SearchBar(searchText: $searchText)
                    .foregroundColor(Color("PrimaryBlack"))
                    .onSubmit {
                        viewModel.fetchData(query: searchText)
                    }
                    .background(Color("PrimaryDarkGray"))
                
                ScrollView {
                    ForEach(viewModel.shows, id: \.self) { show in
                        NavigationLink {
                            Text("Details view")
                        } label: {
                            SearchListElement(show: show, cast: viewModel.cast[show.id] ?? [], viewModel: viewModel)
                        }
                    }
                }
            }
        }
        .background(Color("PrimaryDarkGray"))
        //            .toolbarBackground(Color("PrimaryDarkGray"), for: .navigationBar)
        .foregroundColor(Color("PrimaryWhite"))
        .onAppear {
            viewModel.fetchData(query: defaultSearch)
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
