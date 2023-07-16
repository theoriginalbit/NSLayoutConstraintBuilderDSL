//
//  RectDimension.swift
//
//
//  Created by theoriginalbit on 16/7/2023.
//

import Foundation

/// Constants that specify a dimension or a set of dimensions.
public struct RectDimension: OptionSet {
    public let rawValue: UInt8

    /// Creates a dimension with the specified raw value.
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }

    /// The width dimension.
    public static var width: Self = .init(rawValue: 1)

    /// The height dimension.
    public static var height: Self = .init(rawValue: 1 << 1)

    /// Both dimensions.
    public static var widthHeight: Self = [width, height]
}
