//
//  LandingPageViewController.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 27/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate, FBSDKLoginButtonDelegate {

    let mailChimp = MailChimp()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        setupGoogleSignIn()
        setupFacebookSignIn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        proceedIfLoggedIn()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func proceedIfLoggedIn() {
        if UserStore().isUserLoggedIn() {
            self.performSegue(withIdentifier: "SuiteChoice", sender: self)
        }
    }
    
    func setupGoogleSignIn() {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self

    }
    
    func setupFacebookSignIn() {
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["public_profile", "email"]
        loginButton.delegate = self
    }
    
    // The sign-in flow has finished and was successful if |error| is |nil|.
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard error == nil else {
            print("\(error.localizedDescription)")
            return
        }
        
        //            let idToken = user.authentication.idToken // Safe to send to the server
        //            let fullName = user.profile.name
        let givenName = user.profile.givenName ?? ""
        let familyName = user.profile.familyName ?? ""
        let email = user.profile.email ?? ""
        
        logInUserAndProceed(mailChimpListMember: MailChimpListMember(emailAddress: email, firstName: givenName, lastName: familyName))
        
        print("Logged in via Google as \(user.profile.email)")
    }
    
    
    
    // Finished disconnecting |user| from the app successfully if |error| is |nil|.
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        UserStore().signOut()
    }
    
    @IBAction func signInWithGooglePressed() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func signInWithFacebookPressed() {
        let logInManager = FBSDKLoginManager()

        logInManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result:FBSDKLoginManagerLoginResult?, error:Error?) in
            if let error = error {
                NSLog(error.localizedDescription)
            } else if let result = result {
                if result.isCancelled {
                    NSLog("Log in cancelled")
                } else {
                    self.proceedWithFacebookLogin()
                }
            }
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        // if got the access token then they are signed in. Then get the details from the permissions granted
        
        if let error = error {
            print("Error:" + error.localizedDescription)
        }
        
        proceedWithFacebookLogin()
    }

    func proceedWithFacebookLogin() {
        guard let accessToken = FBSDKAccessToken.current() else { return }
        
        if let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.tokenString, version: nil, httpMethod: "GET") {
            req.start { [weak self] (connection, result, error) -> Void in
                
                guard let fieldDictionary = result as? [String:Any] else { return }
                
                let givenName = fieldDictionary["name"] as? String ?? ""
                let email = fieldDictionary["email"] as? String ?? ""
                
                self?.logInUserAndProceed(mailChimpListMember: MailChimpListMember(emailAddress: email, firstName: givenName, lastName: ""))
                
                print("Logged in via Facebook as \(email)")
            }
        }
    }
    
    func logInUserAndProceed(mailChimpListMember: MailChimpListMember) {
        UserStore().registerValidUser(listMember: mailChimpListMember)
        mailChimp.addUser(mailChimpListMember: mailChimpListMember)
        
        proceedIfLoggedIn()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        UserStore().signOut()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logInViewController = segue.destination as? LogInPageViewController else { return }
        
        logInViewController.isAccountCreation = segue.identifier == "CreateAccount"
    }
}
