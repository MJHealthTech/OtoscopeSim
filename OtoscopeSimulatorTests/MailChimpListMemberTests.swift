//
//  MailChimpListMemberTests.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 14/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import XCTest

class MailChimpListMemberTests: XCTestCase {
    
    var memberJsonText: Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "MailChimpListEntry", withExtension: "txt")!
        let contents = try! Data(contentsOf: url)
        return contents
    }
    
    func testParsingValidUser() {
        let jsonString = String(data:memberJsonText, encoding:String.Encoding.utf8)
        print(jsonString)
    }
}
