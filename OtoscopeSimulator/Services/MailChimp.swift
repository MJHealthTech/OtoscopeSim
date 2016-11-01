// To test if a user is in our MailChimp mailing list we want to read from
// lists/b466ec3402/members/<md5 of email address> passing the API key
// as our user password.
// On the terminal this would look like: curl --request GET --url 'https://us14.api.mailchimp.com/3.0/lists/b466ec3402/members/fdd55a579065a6c9dc6c27ceec9a0df6' --user 'anystring:52c2233bbac868df3d3787c9c717af3d-us14'

import Foundation

class MailChimp {
    let baseUrl = URL(string: "https://us14.api.mailchimp.com/3.0/lists/b466ec3402/members/")!
    // Get the base 64 version of API key by this command: echo -n "anystring:52c2233bbac868df3d3787c9c717af3d-us14" | base64
    let apiKeyAsBase64User = "YW55c3RyaW5nOjUyYzIyMzNiYmFjODY4ZGYzZDM3ODdjOWM3MTdhZjNkLXVzMTQ="
    let session = URLSession.shared
    private var dataTask: URLSessionDataTask!
    
    func getUser(withEmail email:String, completionHandler: @escaping (MailChimpListMember?) -> Swift.Void) {
        
        let request = buildGetUserRequest(forEmail: email)
        executeListQuery(request: request, completionHandler: completionHandler)
    }
    
    fileprivate func buildGetUserRequest(forEmail email: String) -> URLRequest {
        
        let md5EmailAddress = MD5Digester.digest(string: email)!
        let requestUrl = baseUrl.appendingPathComponent(md5EmailAddress)
        var request = URLRequest(url: requestUrl)
        request.setValue("Basic \(apiKeyAsBase64User)", forHTTPHeaderField: "Authorization")
        
        return request
    }

    fileprivate func executeListQuery(request: URLRequest, completionHandler: @escaping (MailChimpListMember?) -> Swift.Void) {
        
        dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            guard let responseData = data else { completionHandler(nil); return }
            
            let mailChimpListMember = MailChimpListMemberParser.parse(memberJsonData: responseData)
            completionHandler(mailChimpListMember)
        }
        
        dataTask.resume()
    }
    
    func addUser(mailChimpListMember: MailChimpListMember, completionHandler: @escaping (_ didSucceed:Bool) -> Swift.Void = {_ in }) {
        let request = buildAddUserRequest(forListMember: mailChimpListMember)
        executeAddUserRequest(request: request, completionHandler: completionHandler)

    }
    
    fileprivate func buildAddUserRequest(forListMember listMember:MailChimpListMember) -> URLRequest {
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        request.setValue("Basic \(apiKeyAsBase64User)", forHTTPHeaderField: "Authorization")
        
        let listMemberJson = listMember.toJsonData()
        request.httpBody = listMemberJson
        
        return request
    }
    
    fileprivate func executeAddUserRequest(request: URLRequest, completionHandler: @escaping (_ didSucceed:Bool) -> Swift.Void) {
        
        let dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            guard error==nil else {
                print(error?.localizedDescription)
                completionHandler(false)
                return
            }
            guard let responseData = data, let responseString = String(data:responseData, encoding: .utf8) else { return }
            
            print(responseString)
            completionHandler(true)
        }
        
        dataTask.resume()
    }
}
