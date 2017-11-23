//
//  PasswordValidCharacters.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2017-11-23.
//

import Foundation


/**
 *  The `PasswordValidCharactersCondition` checks if password string contains only valid characters.
 *  Valid characters are
 *      - letters from a to z, including capitals
 *      - numbers
 *      - exclamation point `!`
 *      - parenthesis `( and )`
 *      - dash `-`
 *      - period `.`
 *      - underscore `_`
 *      - grave accent ```
 *      - tilde `~`
 *      - at sign `@`
 *      - hash mark `#`
 */
public struct PasswordValidCharactersCondition: Condition {


    // MARK: - Properties

    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationPassword", comment: "")

    public let regex = ""

    public var shouldAllowViolation = true

    public init() {
    }

    // MARK: - Check

    public func check(_ text: String?) -> Bool {
        guard let sourceText = text else {
            return false
        }

        return numberOfMatchesWithPattern("[^a-zA-Z\\d!\\(\\)\\-\\._`~@#]", text: sourceText) == 0
    }

    fileprivate func numberOfMatchesWithPattern(_ pattern: String, text: String) -> Int {
        guard let regExpression = try? NSRegularExpression(pattern: pattern, options: []) else {
            return 0
        }

        return regExpression.numberOfMatches(in: text, options: [], range: NSRange(location: 0, length: text.count))
    }

}
