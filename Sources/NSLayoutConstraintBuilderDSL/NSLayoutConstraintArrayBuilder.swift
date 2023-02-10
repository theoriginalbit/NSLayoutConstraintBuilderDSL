//
//  NSLayoutConstraintArrayBuilder.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import class UIKit.NSLayoutConstraint

@resultBuilder
public enum NSLayoutConstraintArrayBuilder {
    public static func buildBlock(_ definitions: [any LayoutConstraintDefinition]...) -> [any LayoutConstraintDefinition] {
        definitions.flatMap { $0 }
    }

    public static func buildExpression(_ definition: some LayoutConstraintDefinition) -> [any LayoutConstraintDefinition] {
        [definition]
    }

    public static func buildExpression(_ constraint: NSLayoutConstraint) -> [any LayoutConstraintDefinition] {
        [PredefinedConstraints([constraint])]
    }

    public static func buildExpression(_ constraints: [NSLayoutConstraint]) -> [any LayoutConstraintDefinition] {
        [PredefinedConstraints(constraints)]
    }

    public static func buildFinalResult(_ definitions: [any LayoutConstraintDefinition]) -> [NSLayoutConstraint] {
        definitions.flatMap(\.constraints)
    }

    public static func buildEither(first definitions: [any LayoutConstraintDefinition]) -> [any LayoutConstraintDefinition] {
        definitions
    }

    public static func buildEither(second definitions: [any LayoutConstraintDefinition]) -> [any LayoutConstraintDefinition] {
        definitions
    }

    public static func buildArray(_ definitions: [[LayoutConstraintDefinition]]) -> [LayoutConstraintDefinition] {
        definitions.flatMap { $0 }
    }

    public static func buildOptional(_ definitions: [LayoutConstraintDefinition]?) -> [LayoutConstraintDefinition] {
        definitions ?? []
    }

    public static func buildLimitedAvailability(_ definitions: [LayoutConstraintDefinition]) -> [LayoutConstraintDefinition] {
        definitions
    }
}
