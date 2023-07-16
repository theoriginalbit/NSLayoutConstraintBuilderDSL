//
//  NSLayoutConstraint+Extended.swift
//
//
//  Created by theoriginalbit on 16/8/21.
//

import class UIKit.NSLayoutConstraint

public extension NSLayoutConstraint {
    /// Activates the array of constraints provided by the builder by passing them through to ``NSLayoutConstraint/activate(_:)``.
    ///
    /// - Parameter builder: The builder which provides an array of constraints to activate.
    /// - Returns: The constraints provided by the builder.
    @discardableResult static func activate(
        @NSLayoutConstraintArrayBuilder builder: () -> [NSLayoutConstraint]
    ) -> [NSLayoutConstraint] {
        let constraints = builder()
        activate(constraints)
        return constraints
    }
}
