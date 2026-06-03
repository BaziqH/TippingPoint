//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class HeaderTVuCell: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var friendsListIcon: DesignableView!
    
    //MARK: - VARIABLES
    var onTap: (()->Void)?
    var onListTap: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        addTap()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func addTap(){
        let friendsTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFriendsList))
        friendsListIcon.addGestureRecognizer(friendsTapGesture)
    }
    
    @objc func handleIconTap() {
        onTap?()
    }
    
    @objc func handleFriendsList() {
        onListTap?()
    }
}
