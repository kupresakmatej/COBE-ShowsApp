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
        VStack {
            VStack {
                AsyncImage(url: URL(string: show.image?["original"] ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 80, height: 100)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(maxWidth: .infinity)
                    case .failure:
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                    @unknown default:
                        Text("Unknown state")
                    }
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)

                Text(show.summary ?? "Summary not found")
                    .font(.subheadline)
                    .foregroundColor(Color.primaryLightGray)
            }
            
            VStack {
                HStack {
                    Text("Cast")
                        .font(.title2.bold())
                        .foregroundColor(Color.primaryLightGray)
                    
                    Spacer()
                    
                    Button() {
                        
                    } label: {
                        Text("show all")
                            .font(.subheadline.bold())
                            .foregroundColor(Color.yellow)
                    }
                    .padding()
                }
                
                ScrollView(.horizontal) {
                    
                }
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var example = Show(id: 1, url: "https://www.tvmaze.com/shows/1/under-the-dome", name: "Under the Dome", language: "English", genres: ["Drama","Science-Fiction","Thriller"], premiered: "2013-06-24", image: ["original": "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg"], rating: Rating(average: 8.0), airtime: "00:35", summary: "Under the Dome is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.")
    
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(), show: example)
    }
}
