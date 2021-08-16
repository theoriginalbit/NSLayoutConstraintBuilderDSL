//
//  NSLayoutConstraint+Extended.swift
//  NSLayoutConstraintBuilderDSL
//
//  Created by Josh Asbury on 16/8/21.
//

import class UIKit.NSLayoutConstraint

extension NSLayoutConstraint {
    @discardableResult
    static func activate(@NSLayoutConstraintArrayBuilder makeConstraints: () -> [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        let constraints = makeConstraints()
        activate(constraints)
        return constraints
    }
}
