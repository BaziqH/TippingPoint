//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
    
//MARK: - TABLE VIEW
extension ServicesVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadHeadingTVuCell(indexPath)
        } else if indexPath.section == 1{
            return loadPropositionsTVuCell(indexPath)
        } else if indexPath.section == 2{
            return loadServicesTVuCell(indexPath)
        }  else if indexPath.section == 3{
            return loadContactUsTVuCell(indexPath)
        } else {
            return UITableViewCell()
        }
    }
}
//MARK: - LOAD CELLS
extension ServicesVC{
    func loadHeadingTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = servicesTableView.dequeueReusableCell(withIdentifier: "HeadingTVuCell", for: indexPath) as? HeadingTVuCell else {
            return HeadingTVuCell()
        }
        let descLabel = "From custom software development to managed cloud infrastructure, we deliver technology solutions designed for businesses ready to scale."
        cell.configure(isIconHidden: false, topTitle: "Our Services", mainLabel: "Enterprise Solutions for \nthe Modern Age", descLabel: descLabel)
        return cell
    }
    func loadPropositionsTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = servicesTableView.dequeueReusableCell(withIdentifier: "PropositionsTVuCell", for: indexPath) as? PropositionsTVuCell else {
            return PropositionsTVuCell()
        }
        return cell
    }
    func loadServicesTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = servicesTableView.dequeueReusableCell(withIdentifier: "ServicesTVuCell", for: indexPath) as? ServicesTVuCell else {
            return ServicesTVuCell()
        }
        return cell
    }
    func loadContactUsTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = servicesTableView.dequeueReusableCell(withIdentifier: "ContactUsTVuCell", for: indexPath) as? ContactUsTVuCell else {
            return ContactUsTVuCell()
        }
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension ServicesVC{
    
    func setupTableView(){
        servicesTableView.delegate = self
        servicesTableView.dataSource = self
        
        servicesTableView.rowHeight = UITableView.automaticDimension
        servicesTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let headingNib = UINib(nibName: "HeadingTVuCell", bundle: nil)
        servicesTableView.register(headingNib, forCellReuseIdentifier: "HeadingTVuCell")
        
        let propositionsNib = UINib(nibName: "PropositionsTVuCell", bundle: nil)
        servicesTableView.register(propositionsNib, forCellReuseIdentifier: "PropositionsTVuCell")
        
        let servicesNib = UINib(nibName: "ServicesTVuCell", bundle: nil)
        servicesTableView.register(servicesNib, forCellReuseIdentifier: "ServicesTVuCell")
        
        let contactNib = UINib(nibName: "ContactUsTVuCell", bundle: nil)
        servicesTableView.register(contactNib, forCellReuseIdentifier: "ContactUsTVuCell")
        
        
    }
}

