//
//  AnchorPoint.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by theoriginalbit on 16/8/21.
//

import UIKit

/// A definition that allows `UIView` to generically constrain to another `UIView` or `UILayoutGuide` with a single implementation.
/// - SeeAlso: ``NSLayoutConstraintConvenience``
public protocol LayoutAnchorPoint: AnyObject {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
}

extension LayoutAnchorPoint {
    /// Convenience to create and activate edge constraints between this anchor point and another with the provided insets.
    ///
    /// - Parameters:
    ///   - edges: The edges to create corresponding constraints.
    ///   - other: The second anchor in the constraint.
    ///   - insets: Insets to apply to the constraints.
    ///   - activateConstraints: Whether to activate the constraints provided by the builder. Provide `false` if you intend to further batch constraints into an activate call. Default `true`.
    /// - Returns: The constraints provided by the builder.
    public func constrain(
        edges: DirectionalRectEdge = .all,
        to other: some LayoutAnchorPoint,
        withInsets insets: NSDirectionalEdgeInsets = .zero,
        activateConstraints: Bool = true
    ) -> [NSLayoutConstraint] {
        let constraints = makeConstraints(edges: edges, to: other, withInsets: insets)
        if activateConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }

    /// Convenience to create and activate dimensional constraints between this anchor point and another with the provided insets.
    ///
    /// - Parameters:
    ///   - dimensions: The dimensions to create corresponding constraints.
    ///   - other: The second anchor in the constraint.
    ///   - activateConstraints: Whether to activate the constraints provided by the builder. Provide `false` if you intend to further batch constraints into an activate call. Default `true`.
    /// - Returns: The constraints provided by the builder.
    public func constrain(
        dimensions: RectDimension,
        to other: some LayoutAnchorPoint,
        activateConstraints: Bool = true
    ) -> [NSLayoutConstraint] {
        let constraints = makeConstraints(dimensions: dimensions, to: other)
        if activateConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }

    @NSLayoutConstraintArrayBuilder
    func makeConstraints(
        edges: DirectionalRectEdge,
        to other: some LayoutAnchorPoint,
        withInsets insets: NSDirectionalEdgeInsets
    ) -> [NSLayoutConstraint] {
        if edges.contains(.top) {
            topAnchor.constraint(equalTo: other.topAnchor, constant: insets.top)
        }
        if edges.contains(.leading) {
            leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: insets.leading)
        }
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: -insets.bottom)
        }
        if edges.contains(.trailing) {
            trailingAnchor.constraint(equalTo: other.trailingAnchor, constant: -insets.trailing)
        }
    }

    @NSLayoutConstraintArrayBuilder
    func makeConstraints(
        dimensions: RectDimension,
        to other: some LayoutAnchorPoint
    ) -> [NSLayoutConstraint] {
        if dimensions.contains(.width) {
            widthAnchor.constraint(equalTo: other.widthAnchor)
        }
        if dimensions.contains(.height) {
            heightAnchor.constraint(equalTo: other.heightAnchor)
        }
    }
}

extension UIView: LayoutAnchorPoint {}
extension UILayoutGuide: LayoutAnchorPoint {}
