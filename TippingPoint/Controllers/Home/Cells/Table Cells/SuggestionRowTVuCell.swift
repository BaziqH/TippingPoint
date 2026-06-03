//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class SuggestionRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var suggestCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
}
//MARK: - COLLECTION VIEW
extension SuggestionRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadSuggestionCVuCell(indexPath)
    }
    
    
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension SuggestionRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2 - 5, height: collectionView.frame.height)
    }
}
//MARK: - LOAD CELLS
extension SuggestionRowTVuCell{
    func loadSuggestionCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = suggestCollectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCVuCell", for: indexPath) as? SuggestionCVuCell else { return SuggestionCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension SuggestionRowTVuCell{
    func setupCollectionView(){
        suggestCollectionView.delegate = self
        suggestCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let suggestionNib = UINib(nibName: "SuggestionCVuCell", bundle: nil)
        suggestCollectionView.register(suggestionNib, forCellWithReuseIdentifier: "SuggestionCVuCell")
    }
}
