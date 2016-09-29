import Foundation

class UserStore {
    private let defaults = UserDefaults.standard
    
    func registerValidUser(listMember:MailChimpListMember) {
        defaults.set(listMember.firstName, forKey: "LoggedInUserFirstName")
        defaults.set(listMember.lastName, forKey: "LoggedInUserLastName")
        defaults.set(listMember.emailAddress, forKey: "LoggedInUserEmailAddress")
    }
    
    func getLoggedInUser() -> MailChimpListMember? {
        
        guard let firstName = defaults.object(forKey: "LoggedInUserFirstName") as? String,
            let lastName = defaults.object(forKey: "LoggedInUserLastName") as? String,
            let emailAddress = defaults.object(forKey: "LoggedInUserEmailAddress") as? String else { return nil }
        
        return MailChimpListMember(emailAddress:emailAddress, firstName:firstName, lastName:lastName)
    }
    
    func signOut() {
        defaults.removeObject(forKey: "LoggedInUserFirstName")
        defaults.removeObject(forKey: "LoggedInUserLastName")
        defaults.removeObject(forKey: "LoggedInUserEmailAddress")
    }
    
    func isUserLoggedIn() -> Bool {
        let emailAddress = defaults.object(forKey: "LoggedInUserEmailAddress")
        return emailAddress != nil
    }
}
