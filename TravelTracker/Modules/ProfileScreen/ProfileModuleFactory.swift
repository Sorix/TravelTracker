//
//  Created by Алексей on 18.11.2024.
//

import UIKit
import RouteComposer

final class ProfileModuleFactory: Factory {
    
    typealias ViewController = ProfileViewController
    typealias Context = Any?
    
    func build(with _: Any?) throws -> ProfileViewController {
        let model = ProfileModel(username: "@ProfileScreen")
        let presenter = ProfilePresenter(model: model)
        let viewController = ProfileViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
