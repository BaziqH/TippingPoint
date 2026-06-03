//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class PromotionRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var promotionCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
}
//MARK: - COLLECTION VIEW
extension PromotionRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadPromotionCVuCell(indexPath)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidthWithSpacing = promotionCollectionView.bounds.width - 20 + 10 // item width + spacing
        var index = round(scrollView.contentOffset.x / cellWidthWithSpacing)
        
        // Adjust index based on swipe velocity to make it feel more natural
        if velocity.x > 0.5 {
            index += 1
        } else if velocity.x < -0.5 {
            index -= 1
        }
        
        let pagedX = index * cellWidthWithSpacing
        targetContentOffset.pointee = CGPoint(x: pagedX, y: 0)
    }
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension PromotionRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width - 20, height: collectionView.frame.height)
    }
}
//MARK: - LOAD CELLS
extension PromotionRowTVuCell{
    func loadPromotionCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = promotionCollectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCVuCell", for: indexPath) as? PromotionCVuCell else { return PromotionCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension PromotionRowTVuCell{
    func setupCollectionView(){
        promotionCollectionView.delegate = self
        promotionCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let promotionNib = UINib(nibName: "PromotionCVuCell", bundle: nil)
        promotionCollectionView.register(promotionNib, forCellWithReuseIdentifier: "PromotionCVuCell")
    }
}

