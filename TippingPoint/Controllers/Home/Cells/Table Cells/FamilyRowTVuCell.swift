//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class FamilyRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var familyCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var cellHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cellWidth: CGFloat = familyCollectionView.frame.width/3 - 20
        let midX = familyCollectionView.bounds.width / 2
        let halfCell = cellWidth / 2
        
        // Calculate how much space is needed to push the first cell to the center
        let leftInset = midX - halfCell
        
        // Apply the inset (Top: 0, Left: calculated, Bottom: 0, Right: standard padding)
        familyCollectionView.contentInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: leftInset)
        
        self.familyCollectionView.layoutIfNeeded()
        updateCellScaling()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
//MARK: - COLLECTION VIEW
extension FamilyRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadFamilyCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension FamilyRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3 - 20, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCellScaling()
    }
}
//MARK: - LOAD CELLS
extension FamilyRowTVuCell{
    func loadFamilyCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = familyCollectionView.dequeueReusableCell(withReuseIdentifier: "FamilyCVuCell", for: indexPath) as? FamilyCVuCell else { return FamilyCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension FamilyRowTVuCell{
    func setupCollectionView(){
        familyCollectionView.delegate = self
        familyCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let paymentNib = UINib(nibName: "FamilyCVuCell", bundle: nil)
        familyCollectionView.register(paymentNib, forCellWithReuseIdentifier: "FamilyCVuCell")
    }
}
//MARK: - UIHELPER FUNCTIONS
extension FamilyRowTVuCell{
    func updateCellScaling() {
        let centerX = familyCollectionView.contentOffset.x + (familyCollectionView.bounds.width / 2)
        
        for cell in familyCollectionView.visibleCells {
            let distance = abs(centerX - cell.center.x)
            let maxScale: CGFloat = 1.25
            let minScale: CGFloat = 1.0
            let range: CGFloat = 200.0
            
            let scale = max(minScale, maxScale - (distance / range) * (maxScale - minScale))
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
