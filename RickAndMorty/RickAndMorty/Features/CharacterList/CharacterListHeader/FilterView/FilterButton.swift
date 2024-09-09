//
//  FilterButton.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import SwiftUI

// MARK: - Constants
private enum Constant {
    static let padding: CGFloat = 16
    static let height: CGFloat = 40
}

struct FilterButton: View {
    // MARK: - Properties
    var action: () -> Void
    var title: String
    var isEnabled: Bool = false
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .padding(.leading, Constant.padding)
                .padding(.trailing, Constant.padding)
        }
        .frame(height: Constant.height, alignment: .center)
        .foregroundColor(isEnabled ? .white : .black)
        .background(
            .black.opacity(isEnabled ? 1.0 : 0.1),
            in: Capsule()
        )
    }
}
