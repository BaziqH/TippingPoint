//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class InfoTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var infoIcon: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoDes: UILabel!
    @IBOutlet weak var checkLabel1: UILabel!
    @IBOutlet weak var checkLabel2: UILabel!
    @IBOutlet weak var checkLabel3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - CONFIGURE
    func configure(model: InfoModel){
        infoIcon.image = UIImage(named: model.image)
        infoLabel.text = model.infoLabel
        infoDes.text = model.infoDesc
        checkLabel1.text = model.checkLabel1
        checkLabel2.text = model.checkLabel2
        checkLabel3.text = model.checkLabel3
    }
}
