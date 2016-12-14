//
//  CreditCardValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2016-11-02.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class CreditCardValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = CreditCardValidator(cardType: .all)
    
    
    // MARK: - Test Success
    
    func testCreditCardValidator_Success() {
        // Given
        let testInput                       = "376031710126369"
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    func testCreditCardValidator_GetCardType_Success() {
        // Given
        let testInput                           = "5300000000000000"
        let expectedResult: CreditCardType    = [.mastercard]
        
        let exp = self.expectation(description: "Card types should be valid")
        
        validator.validCardTypes(for: testInput) { (validCardTypes) in
            XCTAssertEqual(validCardTypes, expectedResult, "Card type of \(testInput) should be \(expectedResult), but returned \(validCardTypes).")
            exp.fulfill()
        }
        
        self.waitForExpectations(timeout: 3, handler: nil)
        
        
    }
    
    
    // MARK: - Test Failure
    
    func testCreditCardValidator_Failure() {
        // Given
        let testInput                       = "3760  a317"
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
}
