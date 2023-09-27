//
//  HomeCoordinator.swift
//  Shows
//
//  Created by Matej Kuprešak on 27.09.2023..
//

import Foundation
import UIKit
import SwiftUI

final class HomeCoordinator: Coordinator {
    private var navigationController: BaseNavigationController = BaseNavigationController()
    
    func start() -> UIViewController {
        return createHomeController()
    }
    
    private func createHomeController() -> UIViewController {
        let vm = HomeViewModel()
        let homeView = HomeView(viewModel: vm)
        let vc = UIHostingController(rootView: homeView)
//        vm.onSearchTapped = {
//            _ = self.createSearchView()
//        }
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
//    private func createSearchView() -> UIViewController {
//        let vm = SearchViewModel()
//        let searchView = SearchView(viewModel: vm)
//        let vc = UIHostingController(rootView: searchView)
//        navigationController.pushViewController(vc, animated: true)
//        return vc
//    }
}
