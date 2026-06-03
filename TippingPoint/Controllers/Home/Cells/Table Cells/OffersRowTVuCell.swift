//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class OffersRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var offersCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
    //MARK: - Auto height function
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.layoutIfNeeded()
        var size = self.offersCollectionView.contentSize
        size.height += 60
        return size
    }
}
//MARK: - COLLECTION VIEW
extension OffersRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadOfferCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension OffersRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3 - 10, height: 100)
    }
}
//MARK: - LOAD CELLS
extension OffersRowTVuCell{
    func loadOfferCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = offersCollectionView.dequeueReusableCell(withReuseIdentifier: "OfferCVuCell", for: indexPath) as? OfferCVuCell else { return OfferCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension OffersRowTVuCell{
    func setupCollectionView(){
        offersCollectionView.delegate = self
        offersCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let offerNib = UINib(nibName: "OfferCVuCell", bundle: nil)
        offersCollectionView.register(offerNib, forCellWithReuseIdentifier: "OfferCVuCell")
    }
}
