//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class MessagesRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var msgCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }
}
//MARK: - COLLECTION VIEW
extension MessagesRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadMessageCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOWLAYOUT
extension MessagesRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 60, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
//MARK: - LOAD CELLS
extension MessagesRowTVuCell{
    func loadMessageCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = msgCollectionView.dequeueReusableCell(withReuseIdentifier: "MessageCVuCell", for: indexPath) as? MessageCVuCell else { return MessageCVuCell() }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension MessagesRowTVuCell{
    func setupCollectionView(){
        msgCollectionView.delegate = self
        msgCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let msgNib = UINib(nibName: "MessageCVuCell", bundle: nil)
        msgCollectionView.register(msgNib, forCellWithReuseIdentifier: "MessageCVuCell")
    }
}
