//
//  Created by Алексей on 29.01.2025.
//


struct PortfolioModel {
    var state: State?
    let username: String
    var coins: [CoinModel] = []
}

extension PortfolioModel {
    
    enum State {
        case normal
        case loading
        case failure
    }
}
