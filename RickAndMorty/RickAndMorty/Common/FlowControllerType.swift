//
//  FlowControllerType.swift
//
//
//  Created by Zain ul Abe Din on 8/9/24.
//

import Foundation
import UIKit

public protocol FlowControllerType: AnyObject {
    init(rootNavigationController: UINavigationController, dependency: DependencyType)
    func startFlow()
}
