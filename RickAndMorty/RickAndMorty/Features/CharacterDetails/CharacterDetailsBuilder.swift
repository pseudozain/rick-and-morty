//
//  CharacterDetailsBuilder.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import UIKit
import SwiftUI

class CharacterDetailsBuilder {
    class func build(character: Character, actionCallback: CharacterDetailsActionCallback?) -> UIViewController {
        let viewModel = CharacterDetailsViewModel(with: character, actionCallback: actionCallback)
        return UIHostingController(rootView: CharacterDetailsView(viewModel: viewModel))
    }
}
