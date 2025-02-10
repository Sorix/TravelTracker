//
//  Created by Алексей on 04.02.2025.
//

import UIKit

final class PortfolioView: UIView {
    
    var coins: Skeletoned<[PortfolioModel.Coin]> = .skeleton
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "bg")
        tableView.register(PortfolioCoinCell.self, forCellReuseIdentifier: "CoinCell")
        tableView.register(PortfolioSkeletonCell.self, forCellReuseIdentifier: "SkeletonCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var refreshControl = UIRefreshControl()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
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

        
        if case .value(let balance) = model.balance {
            balanceLabel.text = "Your balance is \(balance) $"
       // } else if case .loading = model.state {
       //     balanceLabel.text = "loading.."
        } else {
            balanceLabel.text = "[SKELETON]"
        }
        
        
        if case .normal(let coinList) = model.state {
            coins = coinList.coins
        }
        
        if model.state == nil {
            refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            tableView.refreshControl = refreshControl
            
            model.handlers.updateCoinListTap?()
        }
        
        tableView.reloadData()
    }
    
    @objc private func refreshData() {
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
        addSubview(balanceLabel)
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(Configuration.verticalOffset)
            $0.centerX.equalToSuperview()
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PortfolioView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch coins {
        case .skeleton: 5
        case .value(let coins): coins.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch coins {
        case .value(let coins):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? PortfolioCoinCell else {
                return UITableViewCell()
            }
            let coin = coins[indexPath.row]
            cell.configure(with: coin)
            return cell
        case .skeleton:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SkeletonCell", for: indexPath) as? PortfolioCoinCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
}
