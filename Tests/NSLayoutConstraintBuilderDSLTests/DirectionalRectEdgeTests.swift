//
//  DirectionalRectEdgeTests.swift
//
//
//  Created by theoriginalbit on 8/7/2023.
//

@testable import NSLayoutConstraintBuilderDSL
import XCTest

final class DirectionalRectEdgeTests: XCTestCase {
    func test_topEdge_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.top
        let expected: UInt8 = 0b0000_0001
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_leadingEdge_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.leading
        let expected: UInt8 = 0b0000_0010
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_bottomEdge_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.bottom
        let expected: UInt8 = 0b0000_0100
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_trailingEdge_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.trailing
        let expected: UInt8 = 0b0000_1000
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_verticalEdges_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.vertical
        let expected: UInt8 = 0b0000_0101
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_horizontalEdges_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.horizontal
        let expected: UInt8 = 0b0000_1010
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_allEdges_hasExpectedRawValue() {
        let edge = DirectionalRectEdge.all
        let expected: UInt8 = 0b0000_1111
        XCTAssertEqual(edge.rawValue, expected)
    }
}
