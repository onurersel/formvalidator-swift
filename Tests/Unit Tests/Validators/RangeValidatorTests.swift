//
//  RangeValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class RangeValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = RangeValidator(range: 3..<13)
    
    
    // MARK: - Test Success
    
    func testRangeValidator_Success() {
        // Given
        let testInput                       = "1A2B3D4C5D"
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    
    // MARK: - Test Failure
    
    func testRangeValidator_Failure() {
        // Given
        let testInput                       = "1A2B3D4C5D6E"
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
}
