//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class HeadingTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var topTitleIcon: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(isIconHidden: Bool, topTitle: String, mainLabel: String, descLabel: String){
        topTitleIcon.isHidden = isIconHidden
        self.topTitle.text = topTitle
        self.mainLabel.text = mainLabel
        self.descLabel.text = descLabel
    }
    
}
