//
//  Character.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation

struct Character: Codable {
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: String
    let image: URL
    let location: CharacterLocation
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

struct CharacterLocation: Codable {
    let name: String
}


