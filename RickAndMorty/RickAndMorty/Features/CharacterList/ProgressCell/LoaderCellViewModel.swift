//
//  LoaderCellViewModel.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation

protocol LoaderCellViewModelType: ReusableCellViewModelType { }

final class LoaderCellViewModel: LoaderCellViewModelType {
    var reuseIdentifier: String = LoaderCell.reuseId
}
