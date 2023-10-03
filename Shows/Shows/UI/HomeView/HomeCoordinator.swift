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
        vm.onShowTapped = { show in
            _ = self.createDetailsView(of: show)
        }
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
    
    private func createDetailsView(of show: Show) -> UIViewController {
        let vm = DetailsViewModel()
        let detailsView = DetailsView(viewModel: vm, show: show)
        let vc = UIHostingController(rootView: detailsView)
        navigationController.pushViewController(vc, animated: true)
        return navigationController
    }
}
