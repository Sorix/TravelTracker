//
//  Created by Алексей on 16.11.2024.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {
    func configure(with model: SettingsModel)
}

final class SettingsViewController: UIViewController {
    
    private let presenter: PresenterProtocol
    private lazy var customView: SettingsView = {
        let view = SettingsView()
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


extension SettingsViewController: SettingsViewControllerProtocol {
    
    func configure(with model: SettingsModel) {
        customView.configure(with: model)
    }
}

