//
//  AnchorPointTests.swift
//
//
//  Created by theoriginalbit on 8/7/2023.
//

@testable import NSLayoutConstraintBuilderDSL
import XCTest

final class AnchorPointTests: XCTestCase {
    // MARK: - Individual Edges

    func test_makeConstraints_topOnly_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
        let constraints = view.makeConstraints(
            edges: .top,
            to: other,
            withInsets: insets
        )

        XCTAssertEqual(constraints.count, 1)
        validateConstraint(constraints[0], is: .top, firstAnchor: view, secondAnchor: other, constant: insets.top)
    }

    func test_makeConstraints_leadingOnly_safeArea_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
        let constraints = view.makeConstraints(
            edges: .leading,
            to: other.safeAreaLayoutGuide,
            withInsets: insets
        )

        XCTAssertEqual(constraints.count, 1)
        validateConstraint(constraints[0], is: .leading, firstAnchor: view, secondAnchor: other.safeAreaLayoutGuide, constant: insets.leading)
    }

    func test_makeConstraints_bottomOnly_readableContent_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
        let constraints = view.readableContentGuide.makeConstraints(
            edges: .bottom,
            to: other,
            withInsets: insets
        )

        XCTAssertEqual(constraints.count, 1)
        validateConstraint(constraints[0], is: .bottom, firstAnchor: view.readableContentGuide, secondAnchor: other, constant: -insets.bottom)
    }

    func test_makeConstraints_trailingOnly_layoutMargin_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
        let constraints = view.layoutMarginsGuide.makeConstraints(
            edges: .trailing,
            to: other,
            withInsets: insets
        )

        XCTAssertEqual(constraints.count, 1)
        validateConstraint(constraints[0], is: .trailing, firstAnchor: view.layoutMarginsGuide, secondAnchor: other, constant: -insets.trailing)
    }

    // MARK: - All Edges

    func test_makeConstraints_allEdges_withoutInsets_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let constraints = view.makeConstraints(edges: .all, to: other, withInsets: .zero)

        XCTAssertEqual(constraints.count, 4)
        validateConstraint(constraints[0], is: .top, firstAnchor: view, secondAnchor: other, constant: 0)
        validateConstraint(constraints[1], is: .leading, firstAnchor: view, secondAnchor: other, constant: 0)
        validateConstraint(constraints[2], is: .bottom, firstAnchor: view, secondAnchor: other, constant: 0)
        validateConstraint(constraints[3], is: .trailing, firstAnchor: view, secondAnchor: other, constant: 0)
    }

    func test_makeConstraints_allEdges_withInsets_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
        let constraints = view.makeConstraints(edges: .all, to: other, withInsets: insets)

        XCTAssertEqual(constraints.count, 4)
        validateConstraint(constraints[0], is: .top, firstAnchor: view, secondAnchor: other, constant: insets.top)
        validateConstraint(constraints[1], is: .leading, firstAnchor: view, secondAnchor: other, constant: insets.leading)
        validateConstraint(constraints[2], is: .bottom, firstAnchor: view, secondAnchor: other, constant: -insets.bottom)
        validateConstraint(constraints[3], is: .trailing, firstAnchor: view, secondAnchor: other, constant: -insets.trailing)
    }

    // MARK: - Constrain

    func test_constrainAllEdges_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let constraints = view.constrain(edges: .all, to: other, activateConstraints: false)

        XCTAssertEqual(constraints.count, 4)
        validateConstraint(constraints[0], is: .top, firstAnchor: view, secondAnchor: other, constant: 0)
        validateConstraint(constraints[1], is: .leading, firstAnchor: view, secondAnchor: other, constant: 0)
        validateConstraint(constraints[2], is: .bottom, firstAnchor: view, secondAnchor: other, constant: 0)
        validateConstraint(constraints[3], is: .trailing, firstAnchor: view, secondAnchor: other, constant: 0)
    }

    func test_constrainAllEdges_withInsetsProvided_returnsExpected() {
        let view = UIView()
        let other = UIView()

        let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
        let constraints = view.constrain(edges: .all, to: other, withInsets: insets, activateConstraints: false)

        XCTAssertEqual(constraints.count, 4)
        validateConstraint(constraints[0], is: .top, firstAnchor: view, secondAnchor: other, constant: insets.top)
        validateConstraint(constraints[1], is: .leading, firstAnchor: view, secondAnchor: other, constant: insets.leading)
        validateConstraint(constraints[2], is: .bottom, firstAnchor: view, secondAnchor: other, constant: -insets.bottom)
        validateConstraint(constraints[3], is: .trailing, firstAnchor: view, secondAnchor: other, constant: -insets.trailing)
    }

    func test_constrainAllEdges_isActiveDefaultsTrue_returnsExpected() {
        let view = UIView()
        let other = UIView()
        view.addSubview(other)

        let constraints = view.constrain(edges: .all, to: other)

        XCTAssertEqual(constraints.count, 4)
        validateConstraint(constraints[0], is: .top, firstAnchor: view, secondAnchor: other, constant: 0, isActive: true)
        validateConstraint(constraints[1], is: .leading, firstAnchor: view, secondAnchor: other, constant: 0, isActive: true)
        validateConstraint(constraints[2], is: .bottom, firstAnchor: view, secondAnchor: other, constant: 0, isActive: true)
        validateConstraint(constraints[3], is: .trailing, firstAnchor: view, secondAnchor: other, constant: 0, isActive: true)
    }

    // MARK: - Helpers

    private func validateConstraint(
        _ constraint: NSLayoutConstraint,
        is attribute: NSLayoutConstraint.Attribute,
        firstAnchor: LayoutAnchorPoint,
        secondAnchor: LayoutAnchorPoint,
        constant: CGFloat,
        isActive: Bool = false
    ) {
        if attribute == .top {
            XCTAssertEqual(constraint.firstAnchor, firstAnchor.topAnchor)
            XCTAssertEqual(constraint.secondAnchor, secondAnchor.topAnchor)
        } else if attribute == .leading {
            XCTAssertEqual(constraint.firstAnchor, firstAnchor.leadingAnchor)
            XCTAssertEqual(constraint.secondAnchor, secondAnchor.leadingAnchor)
        } else if attribute == .bottom {
            XCTAssertEqual(constraint.firstAnchor, firstAnchor.bottomAnchor)
            XCTAssertEqual(constraint.secondAnchor, secondAnchor.bottomAnchor)
        } else if attribute == .trailing {
            XCTAssertEqual(constraint.firstAnchor, firstAnchor.trailingAnchor)
            XCTAssertEqual(constraint.secondAnchor, secondAnchor.trailingAnchor)
        } else {
            return XCTFail("Attribute not one handled by framework.")
        }

        XCTAssertEqual(constraint.firstAttribute, attribute)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondAttribute, attribute)

        XCTAssertEqual(constraint.priority, .required)
        XCTAssertEqual(constraint.isActive, isActive)

        XCTAssertEqual(constraint.constant, constant)
        XCTAssertEqual(constraint.multiplier, 1, accuracy: .ulpOfOne)
    }
}
