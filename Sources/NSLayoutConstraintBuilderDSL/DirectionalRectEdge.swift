//
//  DirectionalRectEdge.swift
//
//
//  Created by theoriginalbit on 8/7/2023.
//

import Foundation

/// Constants that specify an edge or a set of edges, taking the user interface layout direction into account.
public struct DirectionalRectEdge: OptionSet {
    public let rawValue: UInt8

    /// Creates an edge with the specified raw value.
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }

    /// The top edge.
    public static var top: Self = .init(rawValue: 1)

    /// The leading edge.
    public static var leading: Self = .init(rawValue: 1 << 1)

    /// The bottom edge.
    public static var bottom: Self = .init(rawValue: 1 << 2)

    /// The trailing edge.
    public static var trailing: Self = .init(rawValue: 1 << 3)

    /// All edges.
    public static var all: Self = [.top, .leading, .bottom, .trailing]

    /// The edges on the Y-axis; ``top`` and ``bottom``.
    public static let vertical: Self = [.top, .bottom]

    /// The edges on the X-axis; ``leading`` and ``trailing``.
    public static let horizontal: Self = [.leading, .trailing]
}
