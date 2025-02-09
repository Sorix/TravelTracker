//
//  Created by Алексей on 16.11.2024.
//

import UIKit

protocol PortfolioViewControllerProtocol: AnyObject {
    func configure(with model: PortfolioModel)
}

final class PortfolioViewController: UIViewController {
    
    let presenter: PresenterProtocol
    
    private lazy var customView: PortfolioView = {
        let view = PortfolioView()
        view.backgroundColor = UIColor(named: "bg")
        return view
    }()
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension PortfolioViewController: PortfolioViewControllerProtocol {
    
    func configure(with model: PortfolioModel) {
        customView.configure(with: model)
    }
}


