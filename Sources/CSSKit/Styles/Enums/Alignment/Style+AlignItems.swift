//
//  Style+AlignItems.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Style {
    
    public struct AlignItems: ExpressibleByStringLiteral, RawRepresentable {
        public var rawValue: String
        
        public init(stringLiteral value: String) {
            self.init(rawValue: value)
        }
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        // MARK: Keyword values
        
        /// Normal
        ///
        /// The effect of this keyword is dependent of the layout mode we are in:
        /// - In absolutely-positioned layouts, the keyword behaves like start on
        /// replaced absolutely-positioned boxes, and as stretch on all other absolutely-positioned boxes.
        /// - In static position of absolutely-positioned layouts, the keyword behaves as stretch.
        /// - For flex items, the keyword behaves as stretch.
        /// - For grid items, this keyword leads to a behavior similar to the one of stretch,
        /// except for boxes with an aspect ratio or an intrinsic sizes where it behaves like start.
        /// - The property doesn't apply to block-level boxes, and to table cells.
        public static var normal: Self { "normal" }
        
        /// Stretches 'auto'-sized items to fit the container
        ///
        /// Flex items are stretched such that the cross-size of the item's margin box
        /// is the same as the line while respecting width and height constraints.
        public static var stretch: Self { "stretch" }
        
        // MARK: Positional alignment
        
        /// Packs items around the center
        ///
        /// The flex items' margin boxes are centered within the line on the cross-axis.
        /// If the cross-size of an item is larger than the flex container, it will overflow equally in both directions.
        public static var center: Self { "center" }
        
        /// Packs items from the start
        ///
        /// The items are packed flush to each other toward the start edge of the alignment container in the appropriate axis.
        public static var start: Self { "start" }
        
        /// Packs items from the end
        ///
        /// The items are packed flush to each other toward the end edge of the alignment container in the appropriate axis.
        public static var end: Self { "end" }
        
        /// Aligns the item flush at the start
        ///
        /// The items are packed flush to the edge of the alignment container of the start side of the item, in the appropriate axis.
        public static var selfStart: Self { "self-start" }
        
        /// Aligns the item flush at the end
        ///
        /// The items are packed flush to the edge of the alignment container of the end side of the item, in the appropriate axis.
        public static var selfEnd: Self { "self-end" }
        
        /// Packs flex items from the start
        ///
        /// The cross-start margin edges of the flex items are flushed with the cross-start edge of the line.
        public static var flexStart: Self { "flex-start" }
        
        /// Packs flex items from the end
        ///
        /// The cross-end margin edges of the flex items are flushed with the cross-end edge of the line.
        public static var flexEnd: Self { "flex-end" }

        // MARK: Baseline alignment
        
        /// Baseline
        ///
        /// All flex items are aligned such that their flex container baselines align.
        /// The item with the largest distance between its cross-start margin edge
        /// and its baseline is flushed with the cross-start edge of the line.
        public static var baseline: Self { "baseline" }
        
        /// First baseline
        ///
        /// All flex items are aligned such that their flex container baselines align.
        /// The item with the largest distance between its cross-start margin edge
        /// and its baseline is flushed with the cross-start edge of the line.
        public static var firstBaseline: Self { "first baseline" }
        
        /// Last baseline
        ///
        /// All flex items are aligned such that their flex container baselines align.
        /// The item with the largest distance between its cross-start margin edge
        /// and its baseline is flushed with the cross-start edge of the line.
        public static var lastBaseline: Self { "last baseline" }
        
        // MARK: Overflow alignment
        
        /// Safe
        ///
        /// Used alongside an alignment keyword.
        /// If the chosen keyword means that the item overflows the alignment
        /// container causing data loss, the item is instead aligned as if the alignment mode were start.
        public static var safe: Self { "safe" }
        
        /// Unsafe
        ///
        /// Used alongside an alignment keyword.
        /// Regardless of the relative sizes of the item and alignment
        /// container and whether overflow which causes data loss might happen, the given alignment value is honored.
        public static var unsafe: Self { "unsafe" }

        // MARK: Global values
        
        public static var inherit: Self { "inherit" }
        public static var initial: Self { "initial" }
        public static var unset: Self { "unset" }
    }
    
}
