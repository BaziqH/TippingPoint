//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class HeaderBannerTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
