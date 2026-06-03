//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class ServicesRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        serviceCollectionView.collectionViewLayout = createLayout()
    }

    //MARK: - Auto height function
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.layoutIfNeeded()
        var size = self.serviceCollectionView.contentSize
        size.height += 50
        print(size.height)
        return size
    }
}
//MARK: - COLLECTION VIEW
extension ServicesRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            return loadServiceCVuCell(indexPath)
        } else if indexPath.item == 1{
            return loadServiceGroupCVuCell(indexPath)
        } else if indexPath.item == 2{
            return loadServiceGroupCVuCell(indexPath)
        } else if indexPath.item == 3{
            return loadFastDocCVuCell(indexPath)
        } else {
            return loadOptionsRowCVuCell(indexPath)
        }
    }
}
//MARK: - COLLECTION VIEW COMPOSITIONAL LAYOUT
extension ServicesRowTVuCell: UICollectionViewDelegateFlowLayout{
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.43), height: .fractionalHeight(1), spacingRight: 0)
        
        let halfItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5))
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.57), height: .fractionalHeight(1), item: halfItem, count: 2)
        verticalGroup.interItemSpacing = .fixed(10)
        
        let horizontalGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .estimated(202), items: [item, verticalGroup])
        horizontalGroup.interItemSpacing = .fixed(15)
        
        let mainItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.35))
        let mainGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .estimated(280), items: [ horizontalGroup, mainItem] )
        mainGroup.interItemSpacing = .fixed(10)
        
        let optionItem = CompositionalLayout.createItem(width: .fractionalWidth(0.25), height: .fractionalHeight(1))
        let hGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.28), item: optionItem, count: 4)
        hGroup.interItemSpacing = .fixed(15)
        
        let finalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .estimated(380), items: [mainGroup, hGroup] )
        finalGroup.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: finalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
//MARK: - LOAD CELLS
extension ServicesRowTVuCell{
    func loadServiceCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCVuCell", for: indexPath) as? ServiceCVuCell else { return ServiceCVuCell() }
        return cell
    }
    func loadServiceGroupCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "ServiceGroupCVuCell", for: indexPath) as? ServiceGroupCVuCell else { return ServiceGroupCVuCell() }
        cell.configure(indexPath: indexPath)
        return cell
    }
    func loadFastDocCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "FastDocCVuCell", for: indexPath) as? FastDocCVuCell else { return FastDocCVuCell() }
        return cell
    }
    func loadOptionsRowCVuCell(_ indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "OptionsRowCVuCell", for: indexPath) as? OptionsRowCVuCell else { return OptionsRowCVuCell() }
        cell.configure(indexPath: indexPath)
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension ServicesRowTVuCell{
    func setupCollectionView(){
        serviceCollectionView.delegate = self
        serviceCollectionView.dataSource = self
    }
    
    func registerNibs(){
        let serviceNib = UINib(nibName: "ServiceCVuCell", bundle: nil)
        serviceCollectionView.register(serviceNib, forCellWithReuseIdentifier: "ServiceCVuCell")
        
        let serviceGroupNib = UINib(nibName: "ServiceGroupCVuCell", bundle: nil)
        serviceCollectionView.register(serviceGroupNib, forCellWithReuseIdentifier: "ServiceGroupCVuCell")
        
        let fastDocNib = UINib(nibName: "FastDocCVuCell", bundle: nil)
        serviceCollectionView.register(fastDocNib, forCellWithReuseIdentifier: "FastDocCVuCell")
        
        let optionsNib = UINib(nibName: "OptionsRowCVuCell", bundle: nil)
        serviceCollectionView.register(optionsNib, forCellWithReuseIdentifier: "OptionsRowCVuCell")
    }
}

