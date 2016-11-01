//
//  MailChimpListMember.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 15/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import Foundation

struct MailChimpListMember {
    let emailAddress: String
    let firstName: String
    let lastName: String
    
    func toJsonData() -> Data {
        /*
         {
         "email_address": "urist.mcvankab@freddiesjokes.com",
         "status": "subscribed",
         "merge_fields": {
         "FNAME": "Urist",
         "LNAME": "McVankab"
         }
         }

 */
        let listMemberJson = ["email_address": emailAddress, "status": "subscribed",
                              "merge_fields": ["FIRSTNAME":firstName, "LASTNAME":lastName]] as [String : Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: listMemberJson, options: [])
        
        return jsonData
    }
}
