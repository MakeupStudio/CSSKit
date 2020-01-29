//
//  public enum position.swift
//  CSS
//
//  Created by Maxim Krouk on 12/17/19.
//

import Foundation

extension Style {
    
    public static func position(_ value: Position) -> Self {
        position(value.rawValue)
    }
    
    /// The position CSS property sets how an element is positioned in a document.
    ///
    /// The top, right, bottom, and left properties determine the final location of positioned elements.
    public enum Position: String {
        // Keyword
        
        /// The element is positioned according to the normal flow of the document.
        ///
        /// The top, right, bottom, left, and z-index properties have no effect. This is the default value.
        case `static`
        
        /// The element is positioned according to the normal flow of the document,
        /// and then offset relative to itself based on the values of it's edges.
        ///
        /// The offset does not affect the position of any other elements;
        /// thus, the space given for the element in the page layout is the same as if position were static.
        ///
        /// This value creates a new stacking context when the value of z-index is not auto.
        /// Its effect on table-*-group, table-row, table-column, table-cell, and table-caption elements is undefined.
        case relative
        
        /// The element is removed from the normal document flow, and no space is created for the element in the page layout.
        ///
        /// It is positioned relative to its closest positioned ancestor, if any;
        /// otherwise, it is placed relative to the initial
        /// [containing block](https://developer.mozilla.org/en-US/docs/Web/CSS/Containing_Block) .
        /// Its final position is determined by the values of top, right, bottom, and left.
        ///
        /// This value creates a new stacking context when the value of z-index is not auto.
        /// The margins of absolutely positioned boxes do not
        /// [collapse](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing)
        /// with other margins.
        case absolute
        
        /// The element is removed from the normal document flow, and no space is created for the element in the page layout.
        ///
        /// It is positioned relative to the initial containing block established by the viewport,
        /// except when one of its ancestors has a transform, perspective,
        /// or filter property set to something other than none (see the
        /// [CSS Transforms Spec](https://www.w3.org/TR/css-transforms-1/#propdef-transform) ),
        /// in which case that ancestor behaves as the
        /// [containing block](https://developer.mozilla.org/en-US/docs/Web/CSS/Containing_Block) .
        /// (Note that there are browser inconsistencies with perspective and filter contributing to containing block formation.)
        /// Its final position is determined by the values of top, right, bottom, and left.
        ///
        /// This value always creates a new stacking context.
        /// In printed documents, the element is placed in the same position on every page.
        case fixed
        
        /// The element is positioned according to the normal flow of the document,
        /// and then offset relative to its nearest scrolling ancestor and containing block (nearest block-level ancestor),
        /// including table-related elements, based on the values of it's edges.
        ///
        /// The offset does not affect the position of any other elements.
        /// his value always creates a new stacking context.
        /// Note that a sticky element "sticks" to its nearest ancestor that has a "scrolling mechanism"
        /// (created when overflow is hidden, scroll, auto, or overlay),
        /// even if that ancestor isn't the nearest actually scrolling ancestor.
        /// This effectively inhibits any "sticky" behavior (see the
        /// [Github issue on W3C CSSWG](https://github.com/w3c/csswg-drafts/issues/865) ).
        case sticky
        
        // Global
        case inherit
        case initial
        case unset
    }
    
}
