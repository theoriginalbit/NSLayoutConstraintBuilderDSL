//
//  NSLayoutConstraintArrayBuilder.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 20/8/2022.
//

import UIKit

public protocol LayoutConstraintDefinition {
    var constraints: [NSLayoutConstraint] { get }
}

public struct Pin: LayoutConstraintDefinition {
    public let constraints: [NSLayoutConstraint]

    public init(edges: NSDirectionalRectEdge = .all, of anchor: some AnchorPoint, to parent: some AnchorPoint) {
        var constraints = [NSLayoutConstraint]()
        if edges.contains(.top) {
            constraints.append(anchor.topAnchor.constraint(equalTo: parent.topAnchor))
        }
        if edges.contains(.bottom) {
            constraints.append(anchor.bottomAnchor.constraint(equalTo: parent.bottomAnchor))
        }
        if edges.contains(.leading) {
            constraints.append(anchor.leadingAnchor.constraint(equalTo: parent.leadingAnchor))
        }
        if edges.contains(.trailing) {
            constraints.append(anchor.trailingAnchor.constraint(equalTo: parent.trailingAnchor))
        }
        self.constraints = constraints
    }
}

public extension NSDirectionalRectEdge {
    static let vertical: Self = [.top, .bottom]
    static let horizontal: Self = [.leading, .trailing]
}

public struct PredefinedConstraints: LayoutConstraintDefinition {
    public let constraints: [NSLayoutConstraint]

    public init(_ constraints: [NSLayoutConstraint]) {
        self.constraints = constraints
    }
}
