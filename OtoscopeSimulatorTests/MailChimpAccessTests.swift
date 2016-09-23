//
//  MailChimpAccessTests.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 16/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import Foundation
import XCTest
@testable import OtoscopeSimulator

class MailChimpAccessTests: XCTestCase {
    
    func testReadNormalUser() {
        // want to read from lists/b466ec3402/members/fdd55a579065a6c9dc6c27ceec9a0df6
        
        // API key: 52c2233bbac868df3d3787c9c717af3d-us14
        
        // On terminal: curl --request GET --url 'https://us14.api.mailchimp.com/3.0/lists/b466ec3402/members/fdd55a579065a6c9dc6c27ceec9a0df6' --user 'anystring:52c2233bbac868df3d3787c9c717af3d-us14'
        
        let requestUrl = URL(string: "https://us14.api.mailchimp.com/3.0/lists/b466ec3402/members/fdd55a579065a6c9dc6c27ceec9a0df6")
        var request = URLRequest(url: requestUrl!)

//        let user = "anystring"
//        let password = "52c2233bbac868df3d3787c9c717af3d-us14"
//        let authorizationData = "\(user):\(password)".data(using:String.Encoding.utf8)
//        let base64 = authorizationData?.base64EncodedString()
        let base64User = "YW55c3RyaW5nOjUyYzIyMzNiYmFjODY4ZGYzZDM3ODdjOWM3MTdhZjNkLXVzMTQ="
        request.setValue("Basic \(base64User)", forHTTPHeaderField: "Authorization")
        
        
        let session = URLSession.shared
        let completionHandler = { (data:Data?, response:URLResponse?, error:Error?) -> Swift.Void in
            guard let responseData = data else { return }
            let responseString = String(data:responseData, encoding:String.Encoding.utf8)
            print(responseString)
        }
        let dataTask = session.dataTask(with: request, completionHandler: completionHandler)
        
        dataTask.resume()
        
        sleep(2000)
    }
}
