//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class ServiceGroupCVuCell: UICollectionViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var mainView: DesignableView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var serviceSubtitle: UILabel!
    @IBOutlet weak var sideImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(indexPath: IndexPath){
        if indexPath.row == 1{
            mainView.backgroundColor = UIColor(hex: "FCE6DD", alpha: 1)
            serviceLabel.text = "In-clinic Visit"
            serviceSubtitle.text = "Book Appointment"
            sideImage.image = UIImage(named: "img_whiteman")
        } else {
            mainView.backgroundColor = UIColor(hex: "FFF7E8", alpha: 1)
            serviceLabel.text = "Weight Loss Clinic"
            serviceSubtitle.text = "Healthy Lifestyle"
            sideImage.image = UIImage(named: "img_man2")
        }
    }
}
