//
//  Created by Алексей on 18.11.2024.
//

import UIKit
import RouteComposer

final class ProfileModuleFactory: Factory {
    
    typealias ViewController = ProfileViewController
    typealias Context = Any?
    
    func build(with _: Any?) throws -> ProfileViewController {
        let model = ProfileModel(username: "@Someuser")
        let presenter = ProfilePresenter(model: model)
        let view = ProfileView()
        let viewController = ProfileViewController(presenter: presenter, customView: view)
        presenter.viewController = viewController
        return viewController
    }
}
