//
//  UIView+Extended.swift
//
//
//  Created by theoriginalbit on 16/8/21.
//

import UIKit

public extension UIView {
    /// Adds a view to the end of this view's list of subviews.
    ///
    /// - Parameters:
    ///   - view: The view to be added.
    ///   - translatesAutoresizingMaskIntoConstraints: A Boolean value that determines whether the provided view’s autoresizing mask is translated into Auto Layout constraints. Default `false`.
    ///   - activateConstraints: Whether to activate the constraints provided by the builder. Provide `false` if you intend to further batch constraints into an activate call. Default `true`.
    ///   - constraintsBuilder: The builder that will provide layout constraints to activate.
    /// - Returns: The constraints provided by the builder.
    @discardableResult
    func addSubview(
        _ view: UIView,
        translatesAutoresizingMaskIntoConstraints: Bool = false,
        activateConstraints: Bool = true,
        @NSLayoutConstraintArrayBuilder constraintsBuilder: () -> [NSLayoutConstraint]
    ) -> [NSLayoutConstraint] {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        let constraints = constraintsBuilder()
        if activateConstraints {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }
}
