//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import UIKit
import SwiftUI
import Extensions

class CharacterCell: UITableViewCell {
    // MARK: - Properties
    private var viewModel: CharacterCellViewModelType!
    
    // MARK: - Configuration
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? CharacterCellViewModelType else { return }
        self.viewModel = viewModel
        
        let view = CharacterView(viewModel: viewModel.characterViewModel)
        contentView.host(view)
        
        selectionStyle = .none
    }
}
