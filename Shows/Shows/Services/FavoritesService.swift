//
//  FavoritesService.swift
//  Shows
//
//  Created by Matej Kuprešak on 09.10.2023..
//

import Foundation

protocol FavoritesServiceProtocol {
    var favorites: [Show] { get }
    
    func isFavorite(show: Show) -> Bool
    func addToFavorites(show: Show) -> AddToFavoritesResult
    func removeFromFavorites(show: Show) -> RemoveFromFavoritesResult
    func toggleFavorite(show: Show) -> ToggleFavoritesResult
}

enum AddToFavoritesResult {
    case added
    case alreadyAdded
}

enum RemoveFromFavoritesResult {
    case removed
    case notInFavorites
}

enum ToggleFavoritesResult {
    case added
    case removed
    var isAdded: Bool {
        switch self {
        case .added:
            return true
        case .removed:
            return false
        }
    }
}

class FavoriteService: FavoritesServiceProtocol {
    private var persistenceService: FavoritesPersistenceServiceProtocol
    private(set)var favorites: [Show] {
        get {
            persistenceService.favoriteShows
        }
        set {
            persistenceService.favoriteShows = newValue
        }
    }
    public init(persistenceService: FavoritesPersistenceServiceProtocol) {
        self.persistenceService = persistenceService
        favorites = persistenceService.favoriteShows
    }
    
    func isFavorite(show: Show) -> Bool {
        return favorites.contains(show)
    }
    
    func addToFavorites(show: Show) -> AddToFavoritesResult {
        guard !isFavorite(show: show) else {
            return .alreadyAdded
        }
        favorites.append(show)
        return .added
    }
    
    func removeFromFavorites(show: Show) -> RemoveFromFavoritesResult {
        guard let index = favorites.firstIndex(of: show) else {
            return .notInFavorites
        }
        favorites.remove(at: index)
        return .removed
    }
    
    func toggleFavorite(show: Show) -> ToggleFavoritesResult {
        if isFavorite(show: show) {
            _ = removeFromFavorites(show: show)
            return ToggleFavoritesResult.removed
        }
        _ = addToFavorites(show: show)
        return ToggleFavoritesResult.added
    }
}
