//
//  MailChimpListMemberTests.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 31/10/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import XCTest
@testable import OtoscopeSimulator

class MailChimpListMemberTests: XCTestCase {
    
    func testJson() {
        let mailChimpListMember = MailChimpListMember(emailAddress: "joe.bloggs@mail.com", firstName: "Joe", lastName: "Bloggs")
        
        let listMemberJson = mailChimpListMember.toJsonData()
        XCTAssertNotNil(listMemberJson)
        let listMemberJsonString = String(data: listMemberJson, encoding: .utf8)
        XCTAssertNotNil(listMemberJsonString)
        XCTAssertEqual(listMemberJsonString!, "{\"status\":\"subscribed\",\"merge_fields\":{\"FNAME\":\"Joe\",\"LNAME\":\"Bloggs\"},\"email_address\":\"joe.bloggs@mail.com\"}")
    }
}
