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
}

extension HomeViewModel {
    func fetchShows(showID: Int) {
        networkingService.fetchHomeScreenShow(showID: showID) { [weak self] result in
            switch result {
            case .success(let response):
                print("SUCCESS")
                DispatchQueue.main.async {
                    
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
