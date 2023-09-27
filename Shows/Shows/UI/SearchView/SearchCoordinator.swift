//
//  SearchCoordinator.swift
//  Shows
//
//  Created by Matej Kuprešak on 27.09.2023..
//

import Foundation
import UIKit
import SwiftUI

final class SearchCoordinator: Coordinator {
    private var navigationController: BaseNavigationController
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return createSearchViewController()
    }
    
    private func createSearchViewController() -> UIViewController {
        let vm = SearchViewModel()
        let searchView = SearchView(viewModel: vm)
        let vc = UIHostingController(rootView: searchView)
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
