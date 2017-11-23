//
//  PasswordValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2017-11-23.
//  Copyright © 2017 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PasswordValidatorTests: XCTestCase {


    // MARK: - Properties

    let validator   = PasswordValidator(configuration: ConfigurationSeeds.PasswordStrengthSeeds.veryStrong)


    // MARK: - Test Success

    func testPasswordValidator_Success() {
        // Given
        let testInput                       = "F1@b9a_c12983y"
        let expectedResult: [Condition]?    = nil

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure

    func testPasswordValidator_StrenghtAndInvalidCharacters_Failure() {
        // Given
        let testInput                       = "Fo'"
        let expectedResult: [Condition]?    = validator.conditions

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidator_Strength_Failure() {
        // Given
        let testInput                       = "abcdeABCDS"
        let expectedResult: [Condition]?    = [PasswordStrengthCondition(configuration: ConfigurationSeeds.PasswordStrengthSeeds.veryWeak)]

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidator_Length_Failure() {
        // Given
        let testInput                       = "12345"
        let config                          = PasswordStrengthConfiguration(requiredStrength: .weak)
        let weakValidator                   = PasswordValidator(configuration: config)
        let expectedResult: [Condition]?    = [PasswordStrengthCondition(configuration: config)]

        // Test
        AssertValidator(weakValidator, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidator_InvalidCharacter_Failure() {
        // Given
        let testInput                       = "F1@b9a'_c12983y"
        let expectedResult: [Condition]?    = [PasswordValidCharactersCondition()]

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

}

