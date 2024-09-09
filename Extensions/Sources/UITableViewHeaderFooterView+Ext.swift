//
//  UITableViewHeaderFooterView+Ext.swift
//
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import UIKit

public extension UITableViewHeaderFooterView {
    static var reuseId: String {
        String(describing: Self.self)
    }
}
