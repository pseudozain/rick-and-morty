//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation

protocol CharacterViewModelType: ObservableObject {
    var imageUrl: URL? { get }
    var name: String { get }
    var species: String { get }
}

final class CharacterViewModel: CharacterViewModelType {
    // MARK: - Properties
    @Published var imageUrl: URL?
    @Published var name: String
    @Published var species: String
    
    // MARK: - Initializer
    init(character: Character) {
        name = character.name
        species = character.species
        imageUrl = character.image
    }
}
