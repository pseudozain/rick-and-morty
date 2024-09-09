//
//  PaginatedResposne.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation

struct PaginatedResponse: Codable {
    let info: PageInfo
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case characters = "results"
    }
}

struct PageInfo: Codable {
    let next: URL?
}
