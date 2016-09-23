//
//  UnlockScreenViewController.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 07/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import UIKit

class UnlockScreenViewController: UIViewController {
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var searchingLabel: UILabel!
    @IBOutlet weak var notFoundLabel: UILabel!
    
    let mailChimpQuery = MailChimpQuery()
    
    @IBAction func unlockButtonPressed() {
        unlockIfEmailAddressInMailingList()
    }
    
    @IBAction func emailAddressEditingDidEnd() {
        unlockIfEmailAddressInMailingList()
    }
    
    func unlockIfEmailAddressInMailingList() {
        guard let emailAddress = emailAddressTextField.text,
            emailAddress.characters.count > 0 else { return }
        
        searchingLabel.isHidden = false
        notFoundLabel.isHidden = true
        
        mailChimpQuery.getUser(withEmail: emailAddress) { (mailChimpListMember: MailChimpListMember?) in
            DispatchQueue.main.async(execute: {
                self.searchingLabel.isHidden = true
                
                if mailChimpListMember != nil {
                    Conditions.IsExtraContentUnlocked = true
                    _ = self.navigationController?.popViewController(animated: true)
                } else {
                    self.notFoundLabel.isHidden = false
                }
            })
        }
    }
}
