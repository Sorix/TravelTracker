//
//  Created by Алексей on 29.01.2025.
//

class SettingsPresenter: PresenterProtocol {
  
    weak var viewController: SettingsViewControllerProtocol?
    var model: SettingsModel
    
    init(model: SettingsModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        viewController?.configure(with: model)
    }
}
