//
//  NSLayoutConstraintArrayBuilder.swift
//
//
//  Created by theoriginalbit on 16/8/21.
//

import class UIKit.NSLayoutConstraint

/// A custom parameter attribute that constructs `NSLayoutConstraint` from closures.
///
/// You typically use ``NSLayoutConstraintArrayBuilder`` as a parameter attribute for child view-producing closure parameters, allowing those closures to provide multiple constraints. For example, the following function accepts a closure that produces one or more constraints via the builder.
/// ```
/// func setUpView(
///     @NSLayoutConstraintArrayBuilder builder: () -> [NSLayoutConstraint]
/// ) -> [NSLayoutConstraint]
/// ```
@resultBuilder public enum NSLayoutConstraintArrayBuilder {
    /// Builds an expression within the builder to support converting a constraint into the array this builder requires.
    public static func buildBlock(_ component: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        component.flatMap { $0 }
    }

    /// Builds a ``NSLayoutConstraintConvenience`` expression within the builder to support converting the helper into the array this builder requires.
    public static func buildExpression(_ expression: NSLayoutConstraintConvenience) -> [NSLayoutConstraint] {
        expression.constraints
    }

    /// Builds an expression within the builder to support converting an optional constraint into the array this builder requires.
    public static func buildExpression(_ expression: NSLayoutConstraint?) -> [NSLayoutConstraint] {
        guard let expression else {
            return []
        }
        return [expression]
    }

    /// Builds an expression within the builder to support converting a constraint into the array this builder requires.
    public static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }

    /// Builds an expression within the builder to support direct supply of an array..
    public static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    /// Provides support for “if” statements in multi-statement closures, producing conditional constraints for the “then” branch.
    public static func buildEither(first component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }

    /// Provides support for “if-else” statements in multi-statement closures, producing conditional constraints for the “else” branch.
    public static func buildEither(second component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }

    /// Provides support for loops, producing constraints only when the condition evaluates to true.
    public static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    /// Provides support for “if” statements in multi-statement closures, producing a constraint array that is applied only when the condition evaluates to true.
    public static func buildOptional(_ component: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        component ?? []
    }

    /// Provides support for “if” statements with `#available()` clauses in multi-statement closures, producing conditional constraints for the “then” branch, i.e. the conditionally-available branch.
    public static func buildLimitedAvailability(_ component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }
}
