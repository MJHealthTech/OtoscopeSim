//
//  MailChimpListMemberParser.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 15/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import Foundation
import SwiftyJSON

class MailChimpListMemberParser {
    static let FirstNameFieldName = "FIRSTNAME"
    static let LastNameFieldName = "LASTNAME"

    static func parse(memberJsonData: Data) -> MailChimpListMember? {
        let json = JSON(data: memberJsonData)
        
        if let emailAddress = json["email_address"].string,
            let firstName = json["merge_fields"][FirstNameFieldName].string,
            let lastName = json["merge_fields"][LastNameFieldName].string {
            
            return MailChimpListMember(emailAddress:emailAddress, firstName:firstName, lastName:lastName)
        }
        
        return nil
    }
}
