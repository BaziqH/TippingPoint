//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class ServicesVC: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var servicesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerNibs()
        // Do any additional setup after loading the view.
    }
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
