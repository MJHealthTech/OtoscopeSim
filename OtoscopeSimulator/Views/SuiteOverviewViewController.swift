import UIKit

class SuiteOverviewViewController: UIViewController {
    
    var suiteToDisplay:Suite!
    
    @IBOutlet weak var suiteDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        self.navigationItem.title = suiteToDisplay.name
        suiteDescriptionTextView.attributedText = suiteToDisplay.attributedDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let simulatorViewController = segue.destination as? SimulatorViewController else { return }
        
        simulatorViewController.conditionSet = suiteToDisplay.conditions
    }
}
