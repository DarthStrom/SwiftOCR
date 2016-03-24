//
//  BankOCRTests.swift
//  BankOCRTests
//
//  Created by Jason Duffy on 3/23/16.
//  Copyright © 2016 Kata. All rights reserved.
//

import XCTest
@testable import BankOCR

class BankOCRTests: XCTestCase {

    func testCanParseAnAccountNumber() {
        let accountNumber = "    _  _  _  _  _  _     _ \n" +
                            "|_||_|| || ||_   |  |  ||_ \n" +
                            "  | _||_||_||_|  |  |  | _|\n" +
                            "                           "

        let result = BankOCR.parseNumber(accountNumber)

        XCTAssertEqual(490067715, result)
    }
}
