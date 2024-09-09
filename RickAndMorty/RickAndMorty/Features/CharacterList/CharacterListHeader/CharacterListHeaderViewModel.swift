//
//  CharacterListHeaderViewModel.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation
import Extensions

protocol CharacterListHeaderViewModelType: ReusableCellViewModelType {
    var filterViewModel: FilterViewModel { get }
}

final class CharacterListHeaderViewModel: CharacterListHeaderViewModelType {
    var filterViewModel: FilterViewModel =  FilterViewModel()
    var reuseIdentifier: String = CharacterListHeaderView.reuseId
}
