//
//  Created by Алексей on 29.01.2025.
//

class PortfolioPresenter: PresenterProtocol {
    
    struct Dependencies {
        let coinService: CoinServiceProtocol
    }
  
    weak var viewController: PortfolioViewControllerProtocol?
    var model: PortfolioModel = .init(username: "@Someuser")
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func viewDidLoad() {
        updateView()
    }
    
    func updateCoinList() {
        dependencies.coinService.fetchCoins { [weak self] result in
            switch result {
            case .success(let coins):
                self?.model.coins = coins
//                DispatchQueue.main.async {
//                    self?.view?.showCoins(coins)
//                    let balance = coins.reduce(0.0, { $0 + $1.priceUSD })
//                    self?.view?.showBalance(balance)
//                }
            case .failure(_):
                break
//                DispatchQueue.main.async {
//                    self?.view?.showError(error.localizedDescription)
//                }
            }
        }
    }
    
    func toggleCoinList() {
    }
}

private extension PortfolioPresenter {
    func updateView() {
        viewController?.configure(with: model)
    }
}
