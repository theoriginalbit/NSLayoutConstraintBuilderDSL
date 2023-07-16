//
//  NSLayoutConstraintExtendedTests.swift
//
//
//  Created by theoriginalbit on 9/7/2023.
//

@testable import NSLayoutConstraintBuilderDSL
import XCTest

final class NSLayoutConstraintExtendedTests: XCTestCase {
    func testExample() {
        let view = UIView()
        let other = UIView()
        view.addSubview(other)

        let constraints = NSLayoutConstraint.activate {
            Pin(edges: .all, of: view, to: other)
        }

        XCTAssertTrue(constraints.allSatisfy(\.isActive))
        XCTAssertEqual(constraints.count, 4)
    }
}
