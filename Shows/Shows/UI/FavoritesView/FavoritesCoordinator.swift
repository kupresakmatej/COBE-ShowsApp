//
//  FavoritesCoordinator.swift
//  Shows
//
//  Created by Matej Kuprešak on 27.09.2023..
//

import Foundation
import UIKit
import SwiftUI

final class FavoritesCoordinator: Coordinator {
    private var navigationController: BaseNavigationController
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return createFavoritesViewController()
    }
    
    private func createFavoritesViewController() -> UIViewController {
        let vm = FavoritesViewModel()
        let favoritesView = FavoritesView(viewModel: vm)
        let vc = UIHostingController(rootView: favoritesView)
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
//
//    private func showHomeVC() -> UIViewController {
//        let vm = HomeViewModel()
//        let homeView = HomeView(viewModel: vm)
//        let vc = UIHostingController(rootView: homeView)
//        navigationController.pushViewController(vc, animated: true)
//        return vc
//    }
}
