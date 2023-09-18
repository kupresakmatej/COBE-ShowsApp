//
//  SearchView.swift
//  Shows
//
//  Created by Matej Kuprešak on 18.09.2023..
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBlack")

                ScrollView {
                    HStack {
                        Image(systemName: "globe")
                            .scaledToFit()
                            .foregroundColor(.white)
                        
                        VStack {
                            Text("Example movie")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            
                            Text("Example subtitle")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .background(Color("PrimaryDarkGray"))
        }
        .searchable(text: $searchText)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
