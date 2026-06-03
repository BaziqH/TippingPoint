//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/

class HomeVC: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var homeTableView: UITableView!
    //MARK: - VARIABLES
    var infoArr: [InfoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        setupTableView()
        registerNibs()
    }
}
//MARK: - FILL DATA
extension HomeVC{
    func fillData(){
        infoArr = [
            InfoModel(image: "ic_workflow",
                      infoLabel: "Workflow Automation",
                      infoDesc: "AI agents that automate complex business processes. From document \nprocessing to decision workflows, reduce manual work by 80%.",
                      checkLabel1: "Process Automation",
                      checkLabel2: "Smart Routing",
                      checkLabel3: "Exception Handling"),
            InfoModel(image: "ic_messagesquare",
                      infoLabel: "Conversational Al",
                      infoDesc: "Intelligent chatbots and virtual assistants trained on your data.\nMulti-language support with enterprise-grade security.",
                      checkLabel1: "Custom Training",
                      checkLabel2: "Multi-language",
                      checkLabel3: "24/7 Availability"),
            InfoModel(image: "ic_chartcolumn",
                      infoLabel: "Predictive Analytics",
                      infoDesc: "ML models that forecast trends, detect anomalies, and provide \nactionable insights from your business data.",
                      checkLabel1: "Trend Forecasting",
                      checkLabel2: "Anomaly Detection",
                      checkLabel3: "Real-time Insights"),
            InfoModel(image: "ic_database",
                      infoLabel: "RAG Solutions",
                      infoDesc: "Retrieval-Augmented Generation that connects Al to your proprietary data.\nGet accurate, contextual response from your documents and database",
                      checkLabel1: "Document Intelligence",
                      checkLabel2: "Knowledge Retrieval",
                      checkLabel3: "Hallucination-Free")
        ]
    }
}
