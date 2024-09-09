//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import SwiftUI
import CachedAsyncImage

// MARK: - Constants
private enum Constant {
    static let imageHeight: CGFloat = 80
    static let imageWidth: CGFloat = 80
    static let padding: CGFloat = 16
    static let spacing: CGFloat = 16
    static let viewCornerRadius: CGFloat = 20
    static let imageCornerRadius: CGFloat = 12
    static let borderWidth: CGFloat = 1
    static let textTopPadding: CGFloat = 2
    static let borderColor = Color(red: 0.92, green: 0.92, blue: 0.92)
    static let placeholder = "rick_and_morty"
}

struct CharacterView<ViewModel>: View where ViewModel: CharacterViewModelType {
    // MARK: - Properties
    @StateObject private var viewModel: ViewModel
    
    // MARK: - Initializer
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .leading, content: {
                HStack(alignment: .top, spacing: Constant.spacing, content: {
                    CachedAsyncImage(url: viewModel.imageUrl) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(
                                width: Constant.imageWidth,
                                height: Constant.imageHeight
                            )
                    } placeholder: {
                        Image(Constant.placeholder)
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: Constant.imageWidth,
                                height: Constant.imageHeight
                            )
                    }
                    .cornerRadius(Constant.imageCornerRadius)
                    VStack(alignment: .leading, spacing: .zero, content: {
                        Text(viewModel.name)
                            .font(.title3)
                            .fontWeight(.medium)
                        Text(viewModel.species)
                            .font(.body)
                            .fontWeight(.thin)
                    })
                    .padding(.top, Constant.textTopPadding)
                    Spacer()
                })
            })
            .padding(.all, Constant.padding)
            .cornerRadius(Constant.viewCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constant.viewCornerRadius)
                    .stroke(Constant.borderColor, lineWidth: Constant.borderWidth)
            )
        }
        .padding(.top, Constant.padding/2)
        .padding(.leading, Constant.padding)
        .padding(.trailing, Constant.padding)
        .padding(.bottom, Constant.padding/2)
    }
}

#Preview {
    CharacterView(
        viewModel: CharacterViewModel(
            character: Character(
                name: "Jack Raya",
                status: .dead,
                species: "Human",
                gender: "Male",
                image: URL(string: "https://rickandmortyapi.com/api/character/avatar/361.jpeg")!,
                location: CharacterLocation(name: "Eartch")
            )
        )
    )
}
