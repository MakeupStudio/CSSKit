//
//  CSSStyle+AlignContent.swift
//  CSS
//
//  Created by Maxim Krouk on 12/24/19.
//

import Foundation

extension Style {
    
    public static func alignContent(_ value: AlignContent) -> Self {
        alignContent(value.rawValue)
    }
    
    /// The CSS align-content property sets the distribution of space between
    /// and around content items along a flexbox's cross-axis or a grid's block axis.
    public enum AlignContent: String {
        // MARK: Basic positional alignment
        
        /// Packs items around the center
        ///
        /// The items are packed flush to each other toward the center of the alignment container along the cross axis.
        case center
        
        /// Packs items from the start
        ///
        /// The items are packed flush to each other toward the start edge of the alignment container in the cross axis.
        case start
        
        /// Packs items from the end
        ///
        /// The items are packed flush to each other toward the end edge of the alignment container in the cross axis.
        case end
        
        /// Packs flex items from the start
        ///
        /// The items are packed flush to each other toward the edge of the alignment
        /// container depending on the flex container's cross-start side.
        /// This only applies to flex layout items. For items that are not children of a flex container,
        /// this value is treated like start.
        case flexStart = "flex-start"
        
        /// Packs flex items from the end
        ///
        /// The items are packed flush to each other toward the edge of the alignment container
        /// depending on the flex container's cross-end side.
        /// This only applies to flex layout items. For items that are not children of a flex container,
        /// this value is treated like end.
        case flexEnd = "flex-end"

        // MARK: Normal alignment
        
        /// The items are packed in their default position as if no align-content value was set.
        case normal

        // MARK: Baseline alignment
        
        /// Baseline
        ///
        /// Specifies participation in first- or last-baseline alignment:
        /// aligns the alignment baseline of the box’s first or last baseline set with the corresponding baseline
        /// in the shared first or last baseline set of all the boxes in its baseline-sharing group.
        /// The fallback alignment for first baseline is start, the one for last baseline is end.
        case baseline
        
        /// First baseline
        ///
        /// Specifies participation in first- or last-baseline alignment:
        /// aligns the alignment baseline of the box’s first or last baseline set with the corresponding baseline
        /// in the shared first or last baseline set of all the boxes in its baseline-sharing group.
        /// The fallback alignment for first baseline is start, the one for last baseline is end.
        case firstBaseline = "first baseline"
        
        /// Last baseline
        ///
        /// Specifies participation in first- or last-baseline alignment:
        /// aligns the alignment baseline of the box’s first or last baseline set with the corresponding baseline
        /// in the shared first or last baseline set of all the boxes in its baseline-sharing group.
        /// The fallback alignment for first baseline is start, the one for last baseline is end.
        case lastBaseline = "last baseline"

        // MARK: Distributed alignment
        
        /// Distributes items evenly
        /// The first item is flush with the start, the last is flush with the end
        ///
        /// The items are evenly distributed within the alignment container along the cross axis.
        /// The spacing between each pair of adjacent items is the same.
        /// The first item is flush with the main-start edge, and the last item is flush with the main-end edge.
        case spaceBetween = "space-between"
        
        /// Distributes items evenly Items have a half-size space on either end
        ///
        /// The items are evenly distributed within the alignment container along the cross axis.
        /// The spacing between each pair of adjacent items is the same.
        /// The empty space before the first and after the last item equals half of the space between each pair of adjacent items.
        case spaceAround = "space-around"
        
        /// Distributes items evenly Items have equal space around them
        ///
        /// The items are evenly distributed within the alignment container along the cross axis.
        /// The spacing between each pair of adjacent items, the main-start edge and the first item,
        /// and the main-end edge and the last item, are all exactly the same.
        case spaceEvenly = "space-evenly"
         
        /// Distributes items evenly Stretch 'auto'-sized items to fit the container
        ///
        /// If the combined size of the items along the cross axis is less than the size of the alignment container,
        /// any auto-sized items have their size increased equally (not proportionally),
        /// while still respecting the constraints imposed by max-height/max-width (or equivalent functionality),
        /// so that the combined size exactly fills the alignment container along the cross axis.
        case stretch

        // MARK: Overflow alignment
        
        /// Safe
        ///
        /// Used alongside an alignment keyword. If the chosen keyword means that the item overflows
        /// the alignment container causing data loss, the item is instead aligned as if the alignment mode were start.
        case safe
        
        /// Unsafe
        ///
        /// Used alongside an alignment keyword. Regardless of the relative sizes of the item and alignment container
        /// and whether overflow which causes data loss might happen, the given alignment value is honored.
        case unsafe

        // MARK: Global values
        
        case inherit
        case initial
        case unset
    }
}
