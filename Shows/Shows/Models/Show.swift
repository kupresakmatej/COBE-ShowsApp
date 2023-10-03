//
//  Show.swift
//  Shows
//
//  Created by Matej Kuprešak on 18.09.2023..
//

import Foundation

struct Person: Codable, Identifiable, Hashable {
    let id: Int
    let url: String?
    let name: String
}

struct SearchResponse: Codable {
    let show: Show
}

struct CastResponse: Codable {
    let person: Person
}

struct HomeScreenShow: Codable {
    let show: Show
}

struct HomeScreenSchedule: Codable {
    let show: Show
    var airtime: String?
}

struct Rating: Codable {
    let average: Double?
}

struct Show: Codable, Equatable, Hashable {
    let id: Int
    let url: String
    let name: String
    let language: String?
    let genres: [String]?
    let premiered: String?
    let image: [String: String]?
    let rating: Rating?
    var airtime: String?
    let summary: String?

    static func ==(lhs: Show, rhs: Show) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
