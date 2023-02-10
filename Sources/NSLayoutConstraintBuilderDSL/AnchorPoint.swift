//
//  AnchorPoint.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import UIKit

public protocol AnchorPoint: AnyObject {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}

extension AnchorPoint {
    func constrain(edges: NSDirectionalRectEdge = .all,
                   to other: AnchorPoint,
                   withInsets insets: NSDirectionalEdgeInsets = .zero,
                   activateConstraints: Bool = true) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()

        if edges.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: other.topAnchor, constant: insets.top))
        }
        if edges.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: -insets.bottom))
        }
        if edges.contains(.leading) {
            constraints.append(leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: insets.leading))
        }
        if edges.contains(.trailing) {
            constraints.append(trailingAnchor.constraint(equalTo: other.trailingAnchor, constant: -insets.trailing))
        }
        if activateConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }
}

extension UIView: AnchorPoint {}
extension UILayoutGuide: AnchorPoint {}
