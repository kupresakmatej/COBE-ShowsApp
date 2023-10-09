//
//  FavoritesViewModel.swift
//  Shows
//
//  Created by Matej Kuprešak on 27.09.2023..
//

import Foundation
import SwiftUI
import UIKit

final class FavoritesViewModel: ObservableObject {
    @Published var favorites = [Show]()
    
    var onShowTapped: ((_ show: Show) -> Void)?
            
    private let favoritesService: FavoritesServiceProtocol
    init(favoritesService: FavoritesServiceProtocol) {
        self.favoritesService = favoritesService
        favorites = favoritesService.favorites
    }
            
    func refresh() {
        favorites = favoritesService.favorites
    }
}
