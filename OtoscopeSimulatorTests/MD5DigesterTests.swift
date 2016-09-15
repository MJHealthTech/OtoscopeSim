//
//  MD5DigesterTests.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 15/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import XCTest
@testable import OtoscopeSimulator

class MD5DigesterTests: XCTestCase {
    
    func testEmailAddressToHexString() {
        
        let actualMd5 = MD5Digester.digest(string: "michael.george.2@gmail.com")
        let expectedMd5 = "fdd55a579065a6c9dc6c27ceec9a0df6"
        
        XCTAssertEqual(actualMd5, expectedMd5)
    }
}
