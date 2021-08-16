//
//  UIView+Extended.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import UIKit

public extension UIView {
    @NSLayoutConstraintArrayBuilder func constrain(edges: NSDirectionalRectEdge, to other: UIView, withInsets insets: NSDirectionalEdgeInsets = .zero) -> [NSLayoutConstraint] {
        if edges.contains(.top) {
            topAnchor.constraint(equalTo: other.topAnchor, constant: insets.top)
        }
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: insets.bottom)
        }
        if edges.contains(.leading) {
            leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: insets.leading)
        }
        if edges.contains(.trailing) {
            trailingAnchor.constraint(equalTo: other.trailingAnchor, constant: insets.trailing)
        }
    }
}
