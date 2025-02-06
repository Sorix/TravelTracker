//
//  Created by Алексей on 18.11.2024.
//

import UIKit
import RouteComposer

final class ProfileModuleFactory: Factory {
    
    typealias ViewController = ProfileViewController
    typealias Context = Void
    
    func build(with _: Void) throws -> ProfileViewController {
        let model = ProfileModel(username: "@ProfileScreen")
        let presenter = ProfilePresenter(model: model)
        let viewController = ProfileViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
