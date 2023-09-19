//
//  Show.swift
//  Shows
//
//  Created by Matej Kuprešak on 18.09.2023..
//

import Foundation

struct Show: Codable, Hashable {
    let id: Int
    let url: String
    let name: String
    let language: String
    let genres: [String]
}
