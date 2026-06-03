//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class PropositionsTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var propositionCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
    }
    //MARK: - Auto height function
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.layoutIfNeeded()
        var size = self.propositionCollectionView.contentSize
        size.height += 24
        return size
    }
}
//MARK: - COLLECTION VIEW
extension PropositionsTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadPropositionCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension PropositionsTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width/2 - 10, height: 95)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
//MARK: - LOAD CELLS
extension PropositionsTVuCell{
    func loadPropositionCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = propositionCollectionView.dequeueReusableCell(withReuseIdentifier: "PropositionCVuCell", for: indexPath) as? PropositionCVuCell else { return PropositionCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension PropositionsTVuCell{
    func setupCollectionView(){
        propositionCollectionView.delegate = self
        propositionCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let propositionsNib = UINib(nibName: "PropositionCVuCell", bundle: nil)
        propositionCollectionView.register(propositionsNib, forCellWithReuseIdentifier: "PropositionCVuCell")
    }
}
