//
//  Created by Алексей on 29.01.2025.
//

import Foundation

struct PortfolioModel {
    var state: State?
    var balance: Double?
    var handlers = Handlers()
}

extension PortfolioModel {
    
    enum State {
        case normal(CoinList)
        case loading
        case error
    }
    
    struct Handlers {
        var updateCoinListTap: Action?
        var toggleCoinListDidTap: Action?
        var coinItemDidTap: Action?
    }
    
    struct CoinList {
        var isCollapsed: Bool = true
        let coins: [CoinModel]
        
        init(with coins: [CoinModel]) {
            self.coins = coins
        }
    }
}
