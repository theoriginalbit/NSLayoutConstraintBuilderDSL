//
//  UIViewExtendedTests.swift
//
//
//  Created by Joshua Asbury on 9/7/2023.
//

@testable import NSLayoutConstraintBuilderDSL
import XCTest

final class UIViewExtendedTests: XCTestCase {
    func test_addSubviewWithBuilder_behavesAsExpected() {
        let view = UIView()
        let other = UIView()

        let constraints = view.addSubview(other) {
            Pin(edges: .all, of: view, to: other)
        }

        XCTAssertFalse(other.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraints.allSatisfy(\.isActive))
        XCTAssertEqual(constraints.count, 4)
    }
}
