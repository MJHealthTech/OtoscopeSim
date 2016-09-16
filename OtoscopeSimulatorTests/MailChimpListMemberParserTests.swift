//
//  MailChimpListMemberTests.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 14/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import XCTest
@testable import OtoscopeSimulator

class MailChimpListMemberParserTests: XCTestCase {
    
    var memberJsonData: Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "MailChimpListEntry", withExtension: "txt")!
        let contents = try! Data(contentsOf: url)
        return contents
    }
    
    func testParsingValidUser() {
        
        let listMember = MailChimpListMemberParser.parse(memberJsonData: memberJsonData)
        
        XCTAssertNotNil(listMember)
        XCTAssertEqual(listMember?.emailAddress, "john.holcroft@montreux.co.uk")
        XCTAssertEqual(listMember?.firstName, "John")
        XCTAssertEqual(listMember?.lastName, "Holcroft")
    }
}
