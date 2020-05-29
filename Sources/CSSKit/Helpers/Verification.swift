//
//  Verification.swift
//  CSSKit
//
//  Created by Maxim Krouk on 5/29/20.
//

import Foundation

internal func verifyIdent(_ string: String) -> Bool {
    string.range(
        of: #"^(([\\a-zA-Z_-]{1}[^\d])|[\\a-zA-Z_]{1})([\\a-zA-Z0-9_ -]|(\\.))*$"#,
        options: .regularExpression
    ) != nil
}
