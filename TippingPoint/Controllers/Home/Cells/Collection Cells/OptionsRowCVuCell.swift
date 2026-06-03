//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class OptionsRowCVuCell: UICollectionViewCell {

    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(indexPath: IndexPath){
        if indexPath.row == 4 {
            optionImage.image = UIImage(named: "img_labs")
            optionLabel.text = "Labs"
        } else if indexPath.row == 5 {
            optionImage.image = UIImage(named: "img_medicine")
            optionLabel.text = "Medicines"
        } else if indexPath.row == 6 {
            optionImage.image = UIImage(named: "img_hospital")
            optionLabel.text = "Hospitals"
        } else if indexPath.row == 7 {
            optionImage.image = UIImage(named: "img_blog")
            optionLabel.text = "Blogs"
        }
    }
}
