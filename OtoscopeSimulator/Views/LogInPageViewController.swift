import UIKit

class LogInPageViewController: UIViewController, UITextFieldDelegate {
    
    let mailChimpListQuery = MailChimpQuery()
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var progressLabel: UILabel!
    
    var dismissAction: () -> Void = { () in }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logInButtonPressed() {
        emailAddressTextField.resignFirstResponder()
        attemptToLogIn()
    }

    override func viewDidAppear(_ animated: Bool) {
        progressLabel.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailAddressTextField {
            textField.resignFirstResponder()
            attemptToLogIn()
            return false
        }
        return true
    }
    
    func attemptToLogIn() {
    
        guard let emailAddress = emailAddressTextField.text else { return }
        
        progressLabel.text = "Searching..."
        
        mailChimpListQuery.getUser(withEmail: emailAddress) { (mailChimpListMember:MailChimpListMember?) in
            DispatchQueue.main.async {
                if let listMember = mailChimpListMember {
                    self.setUpForValidUser(listMember: listMember)
                } else {
                    self.emailAddressNotFound()
                }
            }
        }
    }
    
    func emailAddressNotFound() {
        progressLabel.text = "Sorry, we can't find that email address."
    }
    
    func setUpForValidUser(listMember:MailChimpListMember) {
        UserStore().registerValidUser(listMember: listMember)
        
        progressLabel.text = "Hi \(listMember.firstName)!"
        
        self.dismissAction()
        
        self.dismiss(animated: true, completion: nil)
    }
}
