//
//  HomeViewModel.swift
//  Shows
//
//  Created by Matej Kuprešak on 27.09.2023..
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @ObservedObject var networkingService = NetworkingService()
    
    @Published var shows = [Show]()
}

extension HomeViewModel {
    func fetchShows(numberOfShows: Int) {
        for _ in 0..<numberOfShows {
            var randomShow = Int.random(in: 0...100)
            
            networkingService.fetchHomeScreenShow(showID: randomShow) { [weak self] result in
                switch result {
                case .success(let response):
                    print("SUCCESS")
                    DispatchQueue.main.async {
                        self?.shows.append(response)
                        print(self?.shows.count)
                    }
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
        }
    }
}
