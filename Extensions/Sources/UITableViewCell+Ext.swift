//
//  UITableViewCell+Ext.swift
//  
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import Foundation
import UIKit

public extension UITableViewCell {
    static var reuseId: String {
        String(describing: Self.self)
    }
}
