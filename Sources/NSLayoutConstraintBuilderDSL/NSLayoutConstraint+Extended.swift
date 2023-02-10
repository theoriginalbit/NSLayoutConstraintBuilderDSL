//
//  NSLayoutConstraint+Extended.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import class UIKit.NSLayoutConstraint

public extension NSLayoutConstraint {
    @discardableResult
    static func activate(@NSLayoutConstraintArrayBuilder builder: () -> [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        let constraints = builder()
        activate(constraints)
        return constraints
    }
}
