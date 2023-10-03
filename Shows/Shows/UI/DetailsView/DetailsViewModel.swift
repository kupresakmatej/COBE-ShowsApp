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
}
