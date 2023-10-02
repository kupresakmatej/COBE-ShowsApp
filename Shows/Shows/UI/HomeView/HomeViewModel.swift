//
//  HomeViewModel.swift
//  Shows
//
//  Created by Matej Kuprešak on 27.09.2023..
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @ObservedObject var networkingService = NetworkingService()
    
    @Published var shows = [Show]()
    
    @Published var showsSchedule = [Show]()
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayDate = dateFormatter.string(from: Date())
        
        return todayDate
    }
}

extension HomeViewModel {
    func fetchShows(numberOfShows: Int) {
        for _ in 0..<numberOfShows {
            let randomShow = Int.random(in: 0...100)
            
            networkingService.fetchHomeScreenShow(showID: randomShow) { [weak self] result in
                switch result {
                case .success(let response):
                    print("SUCCESS")
                    DispatchQueue.main.async {
                        self?.shows.append(response)
                    }
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
        }
    }
    
    func fetchSchedule(date: String) {
        networkingService.fetchHomeScreenSchedule(date: date) { [weak self] result in
            switch result {
            case .success(let response):
                print("SUCCESS")
                DispatchQueue.main.async {
                    let shows = response.map { $0.show }
                    
                    for i in 0..<shows.count {
                        var updatedShow = shows[i]
                        let airtime = response[i].airtime
                        updatedShow.airtime = airtime
                        self?.showsSchedule.append(updatedShow)
                    }
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }

        }
    }
}
