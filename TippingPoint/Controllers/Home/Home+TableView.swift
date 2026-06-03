/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/

//MARK: - TABLE VIEW
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return infoArr.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadHeadingTVuCell(indexPath)
        } else {
            return loadInfoTVuCell(indexPath)
        }
    }
}
//MARK: - LOAD CELLS
extension HomeVC{
    func loadHeadingTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "HeadingTVuCell", for: indexPath) as? HeadingTVuCell else {
            return HeadingTVuCell()
        }
        return cell
    }
    func loadInfoTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "InfoTVuCell", for: indexPath) as? InfoTVuCell else {
            return InfoTVuCell()
        }
        cell.configure(model: infoArr[indexPath.row])
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension HomeVC{
    
    func setupTableView(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let headingNib = UINib(nibName: "HeadingTVuCell", bundle: nil)
        homeTableView.register(headingNib, forCellReuseIdentifier: "HeadingTVuCell")
        
        let infoNib = UINib(nibName: "InfoTVuCell", bundle: nil)
        homeTableView.register(infoNib, forCellReuseIdentifier: "InfoTVuCell")
    }
}
