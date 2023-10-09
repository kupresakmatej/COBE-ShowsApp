//
//  FavoritesElementView.swift
//  Shows
//
//  Created by Matej Kuprešak on 09.10.2023..
//

import SwiftUI

struct FavoritesElementView: View {
    let show: Show
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: URL(string: show.image?["original"] ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 180, height: 220)
                case .failure:
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                @unknown default:
                    Text("Unknown state")
                }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 220)
            .cornerRadius(25)
            
            Button {
                
            } label: {
                //FavoriteElement()
            }
        }
    }
}
    
struct FavoritesElementView_Previews: PreviewProvider {
    static var example = Show(id: 1, url: "https://www.tvmaze.com/shows/1/under-the-dome", name: "Under the Domea a a a a a  a", language: "English", genres: ["Drama","Science-Fiction","Thriller"], premiered: "2013-06-24", image: ["medium": "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg"], rating: Rating(average: 8.0), airtime: "00:35", summary: "")
        
    static var previews: some View {
        FavoritesElementView(show: example)
    }
}
