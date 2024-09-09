//
//  Filter.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import SwiftUI

// MARK: - Constants
private enum Constant {
    static let padding: CGFloat = 16
    static let spacing: CGFloat = 16
    static let alive = "Alive"
    static let dead = "Dead"
    static let unknown = "Unknown"
}

struct Filter<ViewModel>: View where ViewModel: FilterViewModelType {
    // MARK: - Properties
    @StateObject private var viewModel: ViewModel
    
    // MARK: - Initializer
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: Constant.spacing) {
            FilterButton(
                action: {
                    viewModel.selectedFilter(with: .alive)
                },
                title: Constant.alive,
                isEnabled: viewModel.isAliveEnabled
            )
            
            FilterButton(
                action: {
                    viewModel.selectedFilter(with: .dead)
                },
                title: Constant.dead,
                isEnabled: viewModel.isDeadEnabled
            )
            
            FilterButton(
                action: {
                    viewModel.selectedFilter(with: .unknown)
                },
                title: Constant.unknown,
                isEnabled: viewModel.isUnknownEnabled
            )
            
            Spacer()
        }
        .padding(.all, Constant.padding)
    }
        
}

#Preview {
    Filter(viewModel: FilterViewModel())
}
