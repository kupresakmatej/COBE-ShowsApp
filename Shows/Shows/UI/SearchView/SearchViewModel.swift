//
//  SearchViewModel.swift
//  Shows
//
//  Created by Matej Kuprešak on 19.09.2023..
//

import Foundation
import SwiftUI

final class SearchViewModel: ObservableObject {
    @ObservedObject var networkingService = NetworkingService()
    
    @Published var shows = [Show]()
}

extension SearchViewModel {
    func fetchData(query: String) {
        let request = Request(
            path: "/search/shows?q=girls",
            method: .get,
            type: .json,
            parameters: nil,
            query: nil)
        
        networkingService.fetch(with: request) { [weak self] result in
            switch result {
            case .success(let shows):
                print("SUCCESS")
                DispatchQueue.main.async {
//                    self?.shows = shows.f
                    print("\(shows.count)")
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
