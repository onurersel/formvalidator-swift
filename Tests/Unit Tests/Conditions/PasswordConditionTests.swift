//
//  PasswordValidCharactersConditionTests.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2017-11-23.
//  Copyright © 2017 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PasswordValidCharactersConditionTests: XCTestCase {


    // MARK: - Properties

    let condition       = PasswordValidCharactersCondition()


    // MARK: - Test Success

    func testPasswordValidCharactersCondition_CharactersNone_Success() {
        // Given
        let testInput       = ""
        let expectedResult  = true

        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidCharactersCondition_CharactersAlphanumeric_Success() {
        // Given
        let testInput       = "safjg2g3"
        let expectedResult  = true

        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidCharactersCondition_CharactersValid_Success() {
        // Given
        let testInput       = "abC1-._`~@#"
        let expectedResult  = true

        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure

    func testPasswordValidCharactersCondition_OneInvalid_Failure() {
        // Given
        let testInput       = "abC1-._`~@#'"
        let expectedResult  = false

        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidCharactersCondition_Space_Failure() {
        // Given
        let testInput       = "safjg2g2AWFG   !@-"
        let expectedResult  = false

        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

    func testPasswordValidCharactersCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let expectedResult      = false

        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}

