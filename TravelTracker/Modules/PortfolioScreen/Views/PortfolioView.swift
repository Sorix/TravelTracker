//
//  Created by Алексей on 04.02.2025.
//

import UIKit

final class PortfolioView: UIView {
    
    private lazy var promptLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func configure(with model: PortfolioModel) {
        promptLabel.text = model.username
    }
}

private extension PortfolioView {
    enum Configuration {
        static let verticalOffset: CGFloat = 64
    }
    
    func setupView() {
        backgroundColor = .init(named: "bg")
    }
    
    func setupLayout() {
        addSubview(promptLabel)
        
        promptLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(Configuration.verticalOffset)
            $0.centerX.equalToSuperview()
        }
    }
}
