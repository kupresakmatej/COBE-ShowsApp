//
//  SearchListElement.swift
//  Shows
//
//  Created by Matej Kuprešak on 20.09.2023..
//

import SwiftUI

struct SearchListElement: View {
    let show: Show
    let viewModel: SearchViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: show.image?["medium"] ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                case .failure:
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                @unknown default:
                    Text("Unknown state")
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text(show.name)
                    .font(.headline)
                    .foregroundColor(Color("PrimaryWhite"))
                    .lineLimit(0)
                
                Text(viewModel.getDate(show: show))
                    .font(.subheadline)
                    .foregroundColor(Color("PrimaryLightGray"))
                
                if !show.genres.isEmpty {
                    Text(show.genres.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(Color("PrimaryLightGray"))
                } else {
                    Text("No genres defined")
                        .font(.subheadline)
                        .foregroundColor(Color("PrimaryLightGray"))
                }
            }
            .padding([.top, .bottom])
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .scaledToFit()
                .foregroundColor(Color("PrimaryLightGray"))
                .padding()
        }
        .overlay(
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .background(Color("PrimaryDarkGray")), alignment: .top
        )
    }
}
