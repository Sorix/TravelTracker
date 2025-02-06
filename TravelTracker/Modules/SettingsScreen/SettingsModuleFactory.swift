//
//  Created by Алексей on 18.11.2024.
//

import UIKit
import RouteComposer

final class SettingsModuleFactory: Factory {
    
    typealias ViewController = SettingsViewController
    typealias Context = Void
    
    func build(with _: Void) throws -> SettingsViewController {
        let model = SettingsModel(isDarkModeEnabled: true)
        let presenter = SettingsPresenter(model: model)
        let viewController = SettingsViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
