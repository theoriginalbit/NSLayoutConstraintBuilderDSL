//
//  NSLayoutConstraintConvenience.swift
//
//
//  Created by theoriginalbit on 20/8/2022.
//

import UIKit

public typealias Constrain = NSLayoutConstraintConvenience
public typealias Pin = NSLayoutConstraintConvenience

/// A convenience type that can be used in the ``NSLayoutConstraintArrayBuilder`` for an even more declarative and concise syntax to create constraints.
///
/// There are two type-aliases for this convenience, ``Constrain`` and ``Pin``, which should be the names you use when using this type.
///
/// An example usage:
/// ```swift
/// NSLayoutConstraint.activate {
///     Pin(edges: [.top, .leading, .trailing], of: headerView, to: containerView)
///     Pin(edges: .all, of: contentView, to: containerView)
///     Constrain(edges: .horizontal, of: titleLabel, to: headerView)
/// }
/// ```
public struct NSLayoutConstraintConvenience {
    public let constraints: [NSLayoutConstraint]

    /// Creates an instance which contains an array of constraints built as per the edge parameters.
    ///
    /// - Parameters:
    ///   - edges: The edges to create corresponding constraints.
    ///   - anchor: The first anchor in the constraint.
    ///   - other: The second anchor in the constraint.
    ///   - insets: Insets to apply to the constraints.
    public init(
        edges: DirectionalRectEdge = .all,
        of anchor: some LayoutAnchorPoint,
        to other: some LayoutAnchorPoint,
        withInsets insets: NSDirectionalEdgeInsets = .zero
    ) {
        constraints = anchor.makeConstraints(edges: edges, to: other, withInsets: insets)
    }

    /// Creates an instance which contains an array of constraints built as per the dimension parameters.
    ///
    /// - Parameters:
    ///   - dimensions: The dimensions to create corresponding constraints.
    ///   - anchor: The first anchor in the constraint.
    ///   - other: The second anchor in the constraint.
    public init(
        dimensions: RectDimension,
        of anchor: some LayoutAnchorPoint,
        to other: some LayoutAnchorPoint
    ) {
        constraints = anchor.makeConstraints(dimensions: dimensions, to: other)
    }
}
