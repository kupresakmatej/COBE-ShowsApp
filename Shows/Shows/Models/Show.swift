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

struct Show: Codable, Hashable {
    let id: Int
    let url: String
    let name: String
    let language: String?
    let genres: [String]?
    let premiered: String?
    let image: [String: String]?
}
