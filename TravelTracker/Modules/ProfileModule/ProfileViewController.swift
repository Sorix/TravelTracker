//
//  Created by Алексей on 16.11.2024.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject {
    func configure(with model: ProfileModel)
}

final class ProfileViewController: UIViewController {
    
    private let presenter: PresenterProtocol
    private lazy var customView: ProfileView = {
        let view = ProfileView()
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


extension ProfileViewController: ProfileViewControllerProtocol {
    
    func configure(with model: ProfileModel) {
        customView.configure(with: model)
    }
}

