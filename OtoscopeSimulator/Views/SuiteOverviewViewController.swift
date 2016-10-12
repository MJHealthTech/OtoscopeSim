import UIKit

class SuiteOverviewViewController: UIViewController {
    
    var suiteToDisplay:Suite!
    
    @IBOutlet weak var suiteDescriptionTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var suiteNameLabel: UILabel!
    
    override func viewDidLoad() {
//        self.navigationItem.title = suiteToDisplay.name
        suiteDescriptionTextView.attributedText = suiteToDisplay.attributedDescription
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 166
        self.suiteNameLabel.text = suiteToDisplay.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let simulatorViewController = segue.destination as? SimulatorViewController else { return }
        
        simulatorViewController.conditionSet = suiteToDisplay.conditions
    }
    

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
