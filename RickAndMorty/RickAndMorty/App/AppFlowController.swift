//
//  AppFlowController.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import UIKit
import Extensions

class AppFlowController: FlowControllerType {
    // MARK: - Propreties
    private let rootNavigationController: UINavigationController!
    private let dependencyManger: DependencyType!
    
    // MARK: - Initialization
    required init(rootNavigationController: UINavigationController, dependency: DependencyType) {
        self.rootNavigationController = rootNavigationController
        self.dependencyManger = dependency
    }
    
    // MARK: - Flow
    func startFlow() {
        let viewController = CharacterListBuilder.build { [weak self] action in
            switch action {
            case .openDetails(let character):
                self?.openCharacterDetails(character)
            }
        }
        rootNavigationController.setViewControllers([viewController], animated: true)
    }
}

private extension AppFlowController {
    func openCharacterDetails(_ character: Character) {
        let viewController = CharacterDetailsBuilder.build(character: character) { [weak self] action in
            switch action {
            case .back:
                self?.rootNavigationController.popViewController(animated: true)
            }
        }
        rootNavigationController.setNavigationBarHidden(true, animated: true)
        rootNavigationController.pushViewController(viewController, animated: true)
    }
}
