//
//  Created by Алексей on 18.11.2024.
//

import UIKit
import RouteComposer

final class ProfileModuleFactory: Factory {
    
    typealias ViewController = ProfileViewController
    typealias Context = Any?
    
    func build(with _: Context) throws -> ProfileViewController {
        let presenter = ProfilePresenter()

        let view = UIView()
        let viewController = ProfileViewController(presenter: presenter, customView: view)
        return viewController
    }
}
