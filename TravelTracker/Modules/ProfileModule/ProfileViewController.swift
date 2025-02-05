//
//  Created by Алексей on 16.11.2024.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject {
    func configure(with model: PasscodeModel)
}

final class ProfileViewController: UIViewController {
    
    private let presenter: PresenterProtocol
    private lazy var customView: UIView = {
        let view = UIView()
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

extension ProfileViewController: PasscodeViewControllerProtocol {
    
    func configure(with model: PasscodeModel) {
    }
}

