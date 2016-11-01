import UIKit

class SuiteChoiceTableViewController: UITableViewController {
    
    @IBOutlet weak var signInButton: UIBarButtonItem!

    let buttonImages = [#imageLiteral(resourceName: "ButtonBlue"), #imageLiteral(resourceName: "ButtonGreen"),#imageLiteral(resourceName: "ButtonOrange"), #imageLiteral(resourceName: "ButtonPurple"), #imageLiteral(resourceName: "ButtonRed"), #imageLiteral(resourceName: "ButtonYellow")]

    override func viewWillAppear(_ animated: Bool) {
        
        if UserStore().isUserLoggedIn() {
            guard let firstName = UserStore().getLoggedInUser()?.firstName else { return }
            self.navigationItem.title = "Hi \(firstName)"
            
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.hidesBackButton = true
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Suites.TestSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let suite = Suites.TestSet[indexPath.row]
        let isLocked = Suites.IsLocked(suite)
        let reuseId = isLocked ?  "Locked" : "Unlocked"
    
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        
        cell.imageView?.image = buttonImages[indexPath.row]
        cell.textLabel?.text = Suites.TestSet[indexPath.row].name
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row <= Suites.TestSet.count else { return }
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "SuiteOverview") as? SuiteOverviewViewController else { return }
        
        viewController.suiteToDisplay = Suites.TestSet[indexPath.row]
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func howToBecomeMemberButtonPressed(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Simply go to simulationsense.com in your browser for our one-step sign-up.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignIn" {
            guard let viewController = segue.destination as? LogInPageViewController else { return }
            
            viewController.dismissAction = { [weak self]() in
                self?.tableView.reloadData()
            }
        }
    }
}
