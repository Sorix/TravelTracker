//
//  Created by Алексей on 29.01.2025.
//

class ProfilePresenter: PresenterProtocol {
  
    weak var viewController: ProfileViewControllerProtocol?
    var model: ProfileModel
    
    init(model: ProfileModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        viewController?.configure(with: model)
    }
}
