//
//  Extensions.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 28/04/2022.
//

import Foundation
import UIKit

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}

extension UIView {
    func anchorToFill(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = self.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingAnchor = self.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bottomAnchor = self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let trailingAnchor = self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        NSLayoutConstraint.activate([topAnchor, leadingAnchor, bottomAnchor, trailingAnchor])
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
