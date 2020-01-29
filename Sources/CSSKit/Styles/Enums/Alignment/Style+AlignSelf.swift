//
//  Style+AlignSelf.swift
//  CSS
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Style {
    
    /// The align-self CSS property overrides a grid or flex item's align-items value.
    /// In Grid, it aligns the item inside the grid area.
    /// In Flexbox, it aligns the item on the cross axis.
    ///
    /// Requires `.display` to be `.flex`
    public static func alignSelf(_ value: AlignSelf) -> Self {
        alignSelf(value.rawValue)
    }
    
    public enum AlignSelf: String {
        // MARK: Keyword values
        /// Computes to the parent's align-items value.
        case auto
        
        /// Normal
        ///
        /// The effect of this keyword is dependent of the layout mode we are in:
        /// - In absolutely-positioned layouts, the keyword behaves like start on replaced absolutely-positioned boxes, and as stretch on all other absolutely-positioned boxes.
        /// - In static position of absolutely-positioned layouts, the keyword behaves as stretch.
        /// - For flex items, the keyword behaves as stretch.
        /// - For grid items, this keyword leads to a behavior similar to the one of stretch, except for boxes with an aspect ratio or an intrinsic sizes where it behaves like start.
        /// - The property doesn't apply to block-level boxes, and to table cells.
        case normal
        
        // MARK: Positional alignment
        
        /// Puts the item around the center
        ///
        /// The flex item's margin box is centered within the line on the cross-axis.
        /// If the cross-size of the item is larger than the flex container, it will overflow equally in both directions.
        case center
        
        /// Puts the item at the start
        case start
        
        /// Puts the item at the end
        case end
        
        /// Aligns the item flush at the start
        ///
        /// Aligns the items to be flush with the edge of the alignment container corresponding to the item's start side in the cross axis.
        case selfStart = "self-start"
        
        /// Aligns the item flush at the end
        ///
        /// Aligns the items to be flush with the edge of the alignment container corresponding to the item's end side in the cross axis.
        case selfEnd = "self-end"
        
        /// Puts the flex item at the start
        ///
        /// The cross-start margin edge of the flex item is flushed with the cross-start edge of the line.
        case flexStart = "flex-start"
        
        /// Puts the flex item at the end
        ///
        /// The cross-end margin edge of the flex item is flushed with the cross-end edge of the line.
        case flexEnd = "flex-end"

        // MARK: Baseline alignment
        
        /// Specifies participation in first- or last-baseline alignment:
        /// aligns the alignment baseline of the box’s first or last baseline set with the corresponding baseline
        /// in the shared first or last baseline set of all the boxes in its baseline-sharing group.
        /// The fallback alignment for first baseline is start, the one for last baseline is end.
        case baseline
        
        /// Specifies participation in first- or last-baseline alignment:
        /// aligns the alignment baseline of the box’s first or last baseline set with the corresponding baseline
        /// in the shared first or last baseline set of all the boxes in its baseline-sharing group.
        /// The fallback alignment for first baseline is start, the one for last baseline is end.
        case firstBaseline = "first baseline"
        
        /// Specifies participation in first- or last-baseline alignment:
        /// aligns the alignment baseline of the box’s first or last baseline set with the corresponding baseline
        /// in the shared first or last baseline set of all the boxes in its baseline-sharing group.
        /// The fallback alignment for first baseline is start, the one for last baseline is end.
        case lastBaseline = "last baseline"
        
        /// Stretches 'auto'-sized items to fit the container
        ///
        /// If the combined size of the items along the cross axis is less than the size of the alignment container
        /// and the item is auto-sized, its size is increased equally (not proportionally),
        /// while still respecting the constraints imposed by max-height/max-width (or equivalent functionality),
        /// so that the combined size of all auto-sized items exactly fills the alignment container along the cross axis.
        case stretch

        // MARK: Overflow alignment
        
        /// If the size of the item overflows the alignment container, the item is instead aligned as if the alignment mode were start.
        case safe
        
        /// Regardless of the relative sizes of the item and alignment container, the given alignment value is honored.
        case unsafe

        // MARK: Global values
        
        case inherit
        case initial
        case unset
    }
    
}
