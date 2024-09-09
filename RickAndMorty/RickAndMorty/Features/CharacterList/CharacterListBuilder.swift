//
//  CharacterListBuilder.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import UIKit

class CharacterListBuilder {
    class func build(actionCallback: CharacterListActionCallback?) -> UIViewController {
        let service = AppService()
        let viewModel = CharacterListViewModel(service: service, actionCallback: actionCallback)
        let viewController = CharacterListViewController.instantiateFromStoryboard(with: "Main")
        viewController.viewModel = viewModel
        return viewController
    }
}
