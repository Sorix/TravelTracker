//
//  Created by Алексей on 29.01.2025.
//

import Foundation

protocol PortfolioPresenterProtocol: PresenterProtocol {
    var goToCoinItem: Action? { get set }
}

class PortfolioPresenter: PortfolioPresenterProtocol {
    
    var goToCoinItem: Action?
    
    struct Dependencies {
        let coinService: CoinServiceProtocol
    }
  
    weak var view: PortfolioViewControllerProtocol?
    var model = PortfolioModel()
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func updateCoinList() {
        if case .loading = self.model.state { return }
        self.model.state = .loading
        
        dependencies.coinService.fetchCoins { [weak self] result in
            switch result {
            case .success(let coins):
                DispatchQueue.main.async {
                    self?.handleUpdateCoinList(with: coins)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.handleUpdateCoinList(with: error)
                }
            }
        }
    }
}

extension PortfolioPresenter {
    func viewDidLoad() {
        setupHandlers()
        configureView()
    }
}

private extension PortfolioPresenter {
    
    func handleUpdateCoinList(with coins: [CoinModel]) {
        self.model.state = .normal(.init(with: coins))
        self.model.balance = coins.reduce(0.0, { $0 + $1.priceUSD })
        self.configureView()
    }
    
    func handleUpdateCoinList(with error: Error) {
        self.model.state = .error
        self.configureView()
    }

    func toggleCoinList() {
    }
    
    func setupHandlers() {
        model.handlers.updateCoinListTap = { [weak self] in
            self?.updateCoinList()
        }
        model.handlers.toggleCoinListDidTap = { [weak self] in
            self?.toggleCoinList()
        }
        model.handlers.coinItemDidTap = { [weak self] in
            self?.goToCoinItem?()
        }
    }
    
    func configureView() {
        view?.configure(with: model)
    }
}

