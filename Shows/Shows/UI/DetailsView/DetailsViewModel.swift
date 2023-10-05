//
//  DetailsViewModel.swift
//  Shows
//
//  Created by Matej Kuprešak on 03.10.2023..
//

import Foundation
import SwiftUI

final class DetailsViewModel: ObservableObject {
    @ObservedObject var networkingService = NetworkingService()
    
    @Published var cast = [Int: [Person]]()
}

extension DetailsViewModel {
    func fetchCast(showId: Int) {
        networkingService.fetchCast(showID: showId) { [weak self] result in
            switch result {
            case .success(let response):
                print("SUCCESS")
                DispatchQueue.main.async {
                    let cast = response.map { castResponse in
                        var person = castResponse.person
                            
                        person.character = castResponse.character
                        return person
                    }
                        
                    self?.cast[showId] = cast
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
