//
//  CSSStyle+Display.swift
//  Makeup
//
//  Created by Maxim Krouk on 9/1/19.
//  Copyright © 2019 MakeupStudio. All rights reserved.
//

extension Style {
    
    public static func display(_ value: Display) -> Self {
        display(value.rawValue)
    }
    
    /// The display CSS property sets whether an element is treated as a block or inline element
    /// and the layout used for its children, such as flow layout, grid or flex.
    ///
    /// Formally, the display property sets an element's inner and outer display types.
    /// The outer type sets an element's participation in flow layout; the inner type sets the layout of children.
    /// Some values of display are fully defined in their own individual specifications;
    /// for example the detail of what happens when display: flex is declared is defined in the CSS Flexible Box Model specification.
    /// See the table at the end of this document for all of the individual specifications.
    public enum Display: String {
        
        // MARK: <diplay-box>
        
        /// Turns off the display of an element so that it has no effect on layout
        /// (the document is rendered as though the element did not exist).
        ///
        /// All descendant elements also have their display turned off.
        /// To have an element take up the space that it would normally take,
        /// but without actually rendering anything, use the `visibility` property instead.
        case none
        
        // MARK: <diplay-outside>
        
        /// Lline breaks both before and after the element when in the normal flow.
        ///
        /// The element generates a block element box
        case block
        
        /// In normal flow, the next element will be on the same line if there is space.
        ///
        /// The element generates one or more inline element boxes that do not generate line breaks before or after themselves.
        case inline
        
        // MARK: <diplay-inside>
        
        /// The element lays out its contents using flow layout
        ///
        /// If its outer display type is inline, and it is participating in a block or inline formatting context,
        /// then it generates an inline box. Otherwise it generates a block container box.
        ///
        /// Depending on the value of other properties (such as position, float, or overflow)
        /// and whether it is itself participating in a block or inline formatting context,
        /// it either establishes a new
        /// [block formatting context](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Block_formatting_context)
        /// (BFC) for its contents or integratesits contents into its parent formatting context.
        case flow
        
        /// These elements behave like HTML `<table>` elements. It defines a block-level box.
        case table
        
        /// The element behaves like a block element and lays out its content according to the
        /// [flexbox model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout).
        case flex
        /// The element behaves like a block element and lays out its content according to the
        /// [grid model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout).
        case grid
        
        // MARK: <diplay-listitem>
        
        /// The element generates a block box for the content and a separate list-item inline box.
        ///
        ///
        case listItem = "list-item"
        
        // MARK: <diplay-internal>
        
        /// These elements behave like `<tr>` HTML elements.
        case tableRow = "table-row"
        
        /// These elements behave like `<td>` HTML elements.
        case tableCell = "table-cell"
        
        /// These elements behave like `<col>` HTML elements.
        case tableColumn = "table-column"
        
        /// These elements behave like `<colgroup>` HTML elements.
        case tableColumnGroup = "table-column-group"
        
        /// These elements behave like `<tfoot>` HTML elements.
        case tableFooterGroup = "table-footer-group"
        
        /// These elements behave like `<thead>` HTML elements.
        case tableHeaderGroup = "table-header-group"
        
        /// These elements behave like `<tbody>` HTML elements.
        case tableRowGroup = "table-row-group"
        
        /// These elements behave like `<caption>` HTML elements.
        case tableCaption = "table-caption"
        
        // MARK: <diplay-legacy>
        
        /// The element generates a block element box that will be flowed with surrounding content
        /// as if it were a single inline box (behaving much like a replaced element would).
        case inlineBlock = "inline-block"
        
        /// The element behaves like an inline element and lays out its content according to the flexbox model.
        case inlineFlex = "inline-flex"
        
        /// The element behaves like an inline element and lays out its content according to the grid model.
        case inlineGrid = "inline-grid"
        
        /// The inline-table value does not have a direct mapping in HTML.
        /// It behaves like an HTML `<table>` element, but as an inline box, rather than a block-level box.
        /// Inside the table box is a block-level context.
        case inlineTable = "inline-table"
        
        // GLOBAL
        case inherit
        case initial
        case unset
    }
    
}
