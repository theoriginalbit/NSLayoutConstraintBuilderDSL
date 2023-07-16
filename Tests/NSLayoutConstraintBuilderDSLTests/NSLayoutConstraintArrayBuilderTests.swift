//
//  NSLayoutConstraintArrayBuilderTests.swift
//
//
//  Created by theoriginalbit on 9/7/2023.
//

@testable import NSLayoutConstraintBuilderDSL
import XCTest

final class NSLayoutConstraintArrayBuilderTests: XCTestCase {
    func test_builder_createsExpectedOutput() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v1.addSubview(v2)
        v1.addSubview(v3)

        @NSLayoutConstraintArrayBuilder func onlyIf(_ condition: Bool) -> [NSLayoutConstraint] {
            if condition {
                v3.leadingAnchor.constraint(equalTo: v1.leadingAnchor)
            } else {
                v3.trailingAnchor.constraint(equalTo: v1.trailingAnchor)
            }
        }

        func maybeReturn(_ include: Bool) -> NSLayoutConstraint? {
            if include {
                return v3.topAnchor.constraint(equalTo: v1.topAnchor)
            }
            return nil
        }

        @NSLayoutConstraintArrayBuilder var constraints: [NSLayoutConstraint] {
            for view in [v2, v3] {
                view.centerXAnchor.constraint(equalTo: v1.centerXAnchor)
                view.centerYAnchor.constraint(equalTo: v1.centerYAnchor)
            }

            if #available(iOS 13, *) {
                v1.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: v2.bottomAnchor)
            }

            onlyIf(true)
            onlyIf(false)

            [
                v2.leadingAnchor.constraint(equalTo: v1.leadingAnchor),
                v2.trailingAnchor.constraint(equalTo: v1.trailingAnchor),
            ]

            maybeReturn(true)
            maybeReturn(false)
        }

        XCTAssertEqual(constraints.count, 10)
    }
}
