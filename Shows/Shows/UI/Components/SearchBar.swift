//
//  SearchBar.swift
//  Shows
//
//  Created by Matej Kuprešak on 20.09.2023..
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding()
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBar(searchText: $searchText)
    }
}
