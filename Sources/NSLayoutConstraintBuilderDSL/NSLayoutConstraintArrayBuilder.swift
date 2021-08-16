//
//  NSLayoutConstraintArrayBuilder.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import class UIKit.NSLayoutConstraint

@resultBuilder public enum NSLayoutConstraintArrayBuilder {
    static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }

    static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    // MARK: Support 'if' statements that do not have an 'else'

    static func buildOptional(_ components: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        components ?? []
    }

    // MARK: Support 'if-else' and 'switch' statements

    static func buildEither(first components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }

    static func buildEither(second components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }

    // MARK: Support for 'for..in' loops

    static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    // MARK: Support for 'if #available' statements

    static func buildLimitedAvailability(_ components: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        components
    }
}
