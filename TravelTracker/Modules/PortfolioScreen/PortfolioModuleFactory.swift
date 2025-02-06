//
//  Created by Алексей on 18.11.2024.
//

import UIKit
import RouteComposer

final class PortfolioModuleFactory: Factory {
    
    typealias ViewController = PortfolioViewController
    typealias Context = Void
    
    func build(with _: Void) throws -> PortfolioViewController {
        let model = PortfolioModel(username: "@ProfileScreen")
        let presenter = PortfolioPresenter(model: model)
        let viewController = PortfolioViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
