import UIKit

class SuiteOverviewViewController: UIViewController {
    
    var suiteToDisplay:Suite!
    
    @IBOutlet weak var suiteDescriptionTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var suiteNameLabel: UILabel!
    @IBOutlet weak var startSimulationButton: UIButton!
    
    override func viewDidLoad() {
        suiteDescriptionTextView.attributedText = suiteToDisplay.attributedDescription
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 166
        self.suiteNameLabel.text = suiteToDisplay.name
        
        startSimulationButton.layer.cornerRadius = 8.0
    }
    
    func reportAnalytics() {
        guard let tracker = GAI.sharedInstance().defaultTracker,
            let builder = GAIDictionaryBuilder.createScreenView()
            else { return }
        
        tracker.set(kGAIScreenName, value: suiteToDisplay.name)
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let simulatorViewController = segue.destination as? SimulatorViewController else { return }
        
        simulatorViewController.conditionSet = suiteToDisplay.conditions
    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.3, delay: 1.0, options: [.autoreverse, /*.repeat*/], animations: {
//            self.startSimulationButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        }) { (Bool) in
//            self.startSimulationButton.transform = .identity
//        }
//    }

}

extension SuiteOverviewViewController: UITableViewDelegate {
    
}

extension SuiteOverviewViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return suiteToDisplay.conditions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let imageRowCount = 1
        let conditionsCount = suiteToDisplay.conditions[section].signs.count
        return imageRowCount + conditionsCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return suiteToDisplay.conditions[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isImageCell = indexPath.row == 0
        let reuseIdentifier = isImageCell ? "ConditionImage" : "Sign"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let condition = suiteToDisplay.conditions[indexPath.section]
        
        if let imageCell = cell as? ConditionImageCell {
            imageCell.conditionImageView.image = condition.images.first
            if condition.images.count > 1 {
                imageCell.conditionImageView2.image = condition.images[1]
                imageCell.conditionImageView2.isHidden = false
            } else {
                imageCell.conditionImageView2.image = nil
                imageCell.conditionImageView2.isHidden = true
            }
        } else {
            let signIndex = indexPath.row - 1
            let sign = condition.signs[signIndex]
            
            cell.textLabel?.text = sign
        }
        
        return cell
    }
}
