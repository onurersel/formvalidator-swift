//
//  PasswordValidator.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2017-11-23.
//

import Foundation


/**
 *  The `PasswordValidator` checks if string matches the given `PasswordStrengthCondition` and only contains valid characters.
 *  - seealso: `PasswordStrengthCondition` and `PasswordValidCharactersCondition`.
 */
public struct PasswordValidator: ConfigurableValidator {


    // MARK: - Properties

    public var conditions: [Condition]


    // MARK: - Initializers

    public init(configuration: PasswordStrengthConfiguration) {
        conditions = [
            PasswordStrengthCondition(configuration: configuration),
            PasswordValidCharactersCondition()
        ]
    }

}
