//
//  RectDimensionTests.swift
//
//
//  Created by theoriginalbit on 16/7/2023.
//

@testable import NSLayoutConstraintBuilderDSL
import XCTest

final class RectDimensionTests: XCTestCase {
    func test_width_hasExpectedRawValue() {
        let edge = RectDimension.width
        let expected: UInt8 = 0b0000_0001
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_height_hasExpectedRawValue() {
        let edge = RectDimension.height
        let expected: UInt8 = 0b0000_0010
        XCTAssertEqual(edge.rawValue, expected)
    }

    func test_widthHeightEdge_hasExpectedRawValue() {
        let edge = RectDimension.widthHeight
        let expected: UInt8 = 0b0000_0011
        XCTAssertEqual(edge.rawValue, expected)
    }
}
