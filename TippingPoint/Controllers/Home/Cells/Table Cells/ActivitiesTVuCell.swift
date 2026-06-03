//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class ActivitiesTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
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
        var size = self.activitiesCollectionView.contentSize
        size.height += 190
        return size
    }
}
//MARK: - COLLECTION VIEW
extension ActivitiesTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadActivityCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension ActivitiesTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 120)
    }
}
//MARK: - LOAD CELLS
extension ActivitiesTVuCell{
    func loadActivityCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = activitiesCollectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCVuCell", for: indexPath) as? ActivityCVuCell else { return ActivityCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension ActivitiesTVuCell{
    func setupCollectionView(){
        activitiesCollectionView.delegate = self
        activitiesCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let activityNib = UINib(nibName: "ActivityCVuCell", bundle: nil)
        activitiesCollectionView.register(activityNib, forCellWithReuseIdentifier: "ActivityCVuCell")
    }
}
