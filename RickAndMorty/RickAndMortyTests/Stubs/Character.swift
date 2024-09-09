//
//  Character.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
@testable import RickAndMorty

extension Character {
    static func stub(
        name: String = "Rick",
        status: CharacterStatus = .alive,
        species: String = "Human",
        gender: String = "Male",
        image: URL = URL(string: "www.example.com/img.jpg")!,
        location: CharacterLocation = .stub()
    ) -> Character {
        Character(
            name: name,
            status: status,
            species: species,
            gender: gender,
            image: image,
            location: location
        )
    }
}

extension CharacterLocation {
    static func stub(
        name: String = "Earth"
    ) -> CharacterLocation {
        CharacterLocation(name: name)
    }
}

extension Character: Equatable {
    public static func == (lhs: RickAndMorty.Character, rhs: RickAndMorty.Character) -> Bool {
        return lhs.name == rhs.name
        && lhs.status == rhs.status
        && lhs.species == rhs.species
        && lhs.gender == rhs.gender
        && lhs.image.absoluteString == rhs.image.absoluteString
        && lhs.location.name == rhs.location.name
    }
}
