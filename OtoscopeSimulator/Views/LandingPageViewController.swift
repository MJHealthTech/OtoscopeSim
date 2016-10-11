//
//  LandingPageViewController.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 27/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserStore().isUserLoggedIn() {
            self.performSegue(withIdentifier: "SuiteChoice", sender: self)
        }
    }
}
