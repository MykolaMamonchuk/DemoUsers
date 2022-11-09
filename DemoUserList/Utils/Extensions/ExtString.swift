//
//  ExtString.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Foundation

extension String {
    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }

    func localized(_ replace: String, withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "").SELReplace(subject: "%@", toReplace: replace) ?? ""
    }

    func SELReplace(subject: String, toReplace: String) -> String? {
        let string = NSString(string: self)
        let range = NSMakeRange(0, string.length)
        return string.replacingOccurrences(of: subject, with: toReplace, options: .caseInsensitive, range: range)
    }
}
