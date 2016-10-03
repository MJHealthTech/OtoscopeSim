import UIKit

class SuiteChoiceViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let suiteOverviewViewController = segue.destination as? SuiteOverviewViewController,
            let segueIdentifier = segue.identifier else { return }
        
        switch segueIdentifier {
        case "Suite 1":
            suiteOverviewViewController.suiteToDisplay = Suites.Suite1
            break;

        case "Suite 2":
            suiteOverviewViewController.suiteToDisplay = Suites.Suite2
            break;

        case "Suite 3":
            suiteOverviewViewController.suiteToDisplay = Suites.Suite3
            break;

        case "Suite 4":
            suiteOverviewViewController.suiteToDisplay = Suites.Suite4
            break;

        case "Suite 5":
            suiteOverviewViewController.suiteToDisplay = Suites.Suite5
            break;

        default:
            break;
        }
    }
}
