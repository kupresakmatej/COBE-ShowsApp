//
//  DetailsView.swift
//  Shows
//
//  Created by Matej Kuprešak on 03.10.2023..
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    var show: Show
    
    var body: some View {
        Text("\(show.name)")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var example = Show(id: 1, url: "https://www.tvmaze.com/shows/1/under-the-dome", name: "Under the Dome", language: "English", genres: ["Drama","Science-Fiction","Thriller"], premiered: "2013-06-24", image: ["medium": "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg"], rating: Rating(average: 8.0), airtime: "00:35")
    
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(), show: example)
    }
}
