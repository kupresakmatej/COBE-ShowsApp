//
//  HomeScheduleElement.swift
//  Shows
//
//  Created by Matej Kuprešak on 02.10.2023..
//

import SwiftUI

struct HomeScheduleElement: View {
    var show: Show
    
//    @State var isFavorite: Bool
        
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: show.image?["medium"] ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 80, height: 100)
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 160, height: 200)
                                .aspectRatio(contentMode: .fit)
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
                    .frame(width: 160, height: 200)

                    Button {
                        
                    } label: {
//                        FavoriteElement(isFavorite: $isFavorite)
                    }
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Text(show.airtime ?? "Unknown airtime")
                        .font(.system(size: 14))
                        .foregroundColor(Color.primaryLightGray)
                        .padding(.trailing, 10)
                }

                Text(show.name)
                    .font(.subheadline)
                    .foregroundColor(Color.primaryWhite)
                    .padding(.bottom)
                    .padding(.leading, 10)
                    .lineLimit(1)
                    .frame(maxWidth: 160, alignment: .leading)
                }
        }
        .background(Color.primaryDarkGray)
        .cornerRadius(10)
    }
}

//struct HomeScheduleElement_Previews: PreviewProvider {
//    static var example = Show(id: 1, url: "https://www.tvmaze.com/shows/1/under-the-dome", name: "Under the Domea a a a a a  a", language: "English", genres: ["Drama","Science-Fiction","Thriller"], premiered: "2013-06-24", image: ["medium": "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg"], rating: Rating(average: 8.0), airtime: "00:35", summary: "")
//
//    static var previews: some View {
//        HomeScheduleElement(show: example)
//    }
//}
