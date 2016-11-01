import UIKit

class LogInPageViewController: UIViewController, UITextFieldDelegate {
    
    let mailChimp = MailChimp()
    var isAccountCreation:Bool = false
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    var dismissAction: () -> Void = { () in }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logInButtonPressed() {
        emailAddressTextField.resignFirstResponder()
        attemptToLogIn()
    }

    @IBAction func createAccountButtonPressed() {
        emailAddressTextField.resignFirstResponder()
        attemptToSignUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        progressLabel.text = ""
        
        logInButton.isHidden = isAccountCreation
        createAccountButton.isHidden = !isAccountCreation
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
        
        mailChimp.getUser(withEmail: emailAddress) { (mailChimpListMember:MailChimpListMember?) in
            DispatchQueue.main.async {
                if let listMember = mailChimpListMember {
                    self.setUpForValidUser(listMember: listMember)
                } else {
                    self.emailAddressNotFound()
                }
            }
        }
    }
    
    func attemptToSignUp() {

        guard let emailAddress = emailAddressTextField.text else { return }
        
        progressLabel.text = "Creating..."

        let newListMember = MailChimpListMember(emailAddress: emailAddress, firstName: "", lastName: "")

        mailChimp.addUser(mailChimpListMember: newListMember) { [weak self] (didSucceed:Bool) in
            if didSucceed {
                self?.setUpForValidUser(listMember: newListMember)
            } else {
                self?.progressLabel.text = "Unable to create account"
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
