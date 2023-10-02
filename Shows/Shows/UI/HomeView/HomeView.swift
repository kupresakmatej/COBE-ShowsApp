//
//  HomeView.swift
//  Shows
//
//  Created by Matej Kuprešak on 25.09.2023..
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.primaryBlack
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Text("Shows")
                            .font(.largeTitle.bold())
                            .foregroundColor(Color.primaryLightGray)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Text("show all")
                                .font(.headline.bold())
                                .foregroundColor(Color.yellow)
                        }
                        .padding()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.shows, id: \.self) { show in
                                NavigationLink {
                                    Text("Details view")
                                } label: {
                                    HomeShowElement(show: show)
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                VStack {
                    
                }
            }
        }
        .onAppear {
            viewModel.fetchShows(numberOfShows: 10)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
