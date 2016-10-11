import UIKit

class TrainingLandingPageViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        
        if let userDetails = UserStore().getLoggedInUser() {
            userNameLabel.text = "Hi \(userDetails.firstName)"
        }
//        forceLandscapeLeftOrientation()
    }
    
    func forceLandscapeLeftOrientation() {
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .landscapeLeft }
    
    override var shouldAutorotate: Bool { return true }
    
    @IBAction func signOutPressed() {
        UserStore().signOut()
        
        if let landingPageViewController = storyboard?.instantiateViewController(withIdentifier: "LandingPage") {
            show(landingPageViewController, sender: self)
        }
    }
}
