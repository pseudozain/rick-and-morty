//
//  CharacterListHeaderView.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import UIKit
import SwiftUI

final class CharacterListHeaderView: UITableViewHeaderFooterView {
    // MARK: - Properties
    private var viewModel: CharacterListHeaderViewModelType!
    
    // MARK: - Configuration
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? CharacterListHeaderViewModelType else { return }
        self.viewModel = viewModel
        contentView.host(Filter(viewModel: viewModel.filterViewModel))
    }
}
