//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation

protocol CharacterCellViewModelType: ReusableCellViewModelType {
    var characterViewModel: CharacterViewModel { get }
}

final class CharacterCellViewModel: CharacterCellViewModelType {
    // MARK: - Properties
    var reuseIdentifier: String { CharacterCell.reuseId }
    var characterViewModel: CharacterViewModel
    
    // MARK: - Initializer
    init(character: Character) {
        characterViewModel = CharacterViewModel(character: character)
    }
}
