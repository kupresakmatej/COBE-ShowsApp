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
    
    func getDate(show: Show) -> String {
        let date = show.premiered.split(separator: "-")
        
        let year = date[0]
        
        return String(year)
    }
}

extension SearchViewModel {
    func fetchData(query: String) {
        let request = Request(
            path: "/search/shows?q=",
            method: .get,
            type: .json,
            parameters: nil,
            query: query)
        
        networkingService.fetch(with: request) { [weak self] result in
            switch result {
            case .success(let shows):
                print("SUCCESS")
                DispatchQueue.main.async {
                    self?.shows = shows
                    print("\(shows.count)")
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
