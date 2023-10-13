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
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Text("show all")
                                .font(.headline.bold())
                                .foregroundColor(Color.yellow)
                        }
                        .padding()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.shows, id: \.self) { show in
                                Button {
                                    viewModel.onShowTapped?(show)
                                } label: {
                                    HomeShowElement(favoriteService: viewModel.favoriteService, show: show)
                                }
                            }
                        }
                    }
                    .frame(height: 280)
                }
                
                VStack {
                    VStack {
                        HStack {
                            Text("Schedule")
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
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.showsSchedule, id: \.self) { show in
                                    Button {
                                        viewModel.onShowTapped?(show)
                                    } label: {
                                        HomeScheduleElement(favoriteService: viewModel.favoriteService, show: show)
                                    }
                                }
                            }
                        }
                        .frame(height: 275)
                    }
                }
                .padding(.bottom)
                
                Spacer()
                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchShows(numberOfShows: 10)

            viewModel.fetchSchedule(date: viewModel.getDate())
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(viewModel: HomeViewModel())
//    }
//}
