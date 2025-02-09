//
//  Created by Алексей on 04.02.2025.
//

import UIKit

final class PortfolioView: UIView {
    
    var coins: [CoinModel] = []
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "bg")
        tableView.register(CoinCell.self, forCellReuseIdentifier: "CoinCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //Refresh control
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
        
        //Refresh control
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    

    
    func configure(with model: PortfolioModel) {

        if model.state == nil {
            model.handlers.updateCoinListTap?()
        }
        
        balanceLabel.text = "Your balance is \(model.balance ?? 0) $"
        
        if case .normal(let coinList) = model.state {
            coins = coinList.coins
        }
        
        tableView.reloadData()
    }
    
    @objc private func refreshData() {
        //((superview as! PortfolioViewController).presenter as! PortfolioPresenter).updateCoinList()
        //presenter.loadPortfolio()
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
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinCell else {
            return UITableViewCell()
        }
        let coin = coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
}
