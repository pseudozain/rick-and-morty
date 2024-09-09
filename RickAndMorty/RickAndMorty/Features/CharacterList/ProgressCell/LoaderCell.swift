//
//  LoaderCell.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import UIKit
import SwiftUI



class LoaderCell: UITableViewCell {
    // MARK: - Properties
    private var viewModel: LoaderCellViewModelType!
    
    // MARK: - Configuration
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? LoaderCellViewModelType else { return }
        self.viewModel = viewModel
        
        contentView.host(LoaderView())
        selectionStyle = .none
    }
}
