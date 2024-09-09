//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Propreties
    lazy var window: UIWindow? = UIWindow()
    private lazy var rootNavigationController = UINavigationController()
    private var flowController: FlowControllerType!
    
    // MARK: - Application launch
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        flowController = AppFlowController(
            rootNavigationController: rootNavigationController,
            dependency: DependencyManager()
        )
        
        flowController.startFlow()
        
        return true
    }
}

