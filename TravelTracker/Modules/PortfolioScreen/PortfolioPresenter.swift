//
//  Created by Алексей on 29.01.2025.
//

class PortfolioPresenter: PresenterProtocol {
  
    weak var viewController: PortfolioViewControllerProtocol?
    var model: PortfolioModel
    
    init(model: PortfolioModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        viewController?.configure(with: model)
    }
}
