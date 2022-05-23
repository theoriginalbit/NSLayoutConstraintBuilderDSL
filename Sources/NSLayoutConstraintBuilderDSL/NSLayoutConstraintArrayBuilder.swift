//
//  NSLayoutConstraintArrayBuilder.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import class UIKit.NSLayoutConstraint

@resultBuilder public enum NSLayoutConstraintArrayBuilder {
    public static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }

    public static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    // MARK: Support 'if' statements that do not have an 'else'

    public static func buildOptional(_ components: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        components ?? []
    }

    // MARK: Support 'if-else' and 'switch' statements

    public static func buildEither(first components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }

    public static func buildEither(second components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }

    // MARK: Support for 'for..in' loops

    public static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    // MARK: Support for 'if #available' statements

    public static func buildLimitedAvailability(_ components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }
}
