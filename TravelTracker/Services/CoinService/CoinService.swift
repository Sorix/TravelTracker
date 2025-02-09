//
//  Created by Алексей on 06.02.2025.
//

import Foundation

protocol CoinServiceProtocol {
    func fetchCoins(completion: @escaping (Result<[CoinModel], Error>) -> Void)
}

class CoinService: CoinServiceProtocol {
    func fetchCoins(completion: @escaping (Result<[CoinModel], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let coins = [
                CoinModel(id: "btc", name: "Bitcoin", imageUrl: "btc_image", priceUSD: 30000),
                CoinModel(id: "eth", name: "Ethereum", imageUrl: "eth_image", priceUSD: 2000),
                CoinModel(id: "ltc", name: "Litecoin", imageUrl: "ltc_image", priceUSD: 150)
            ]
            completion(.success(coins))
        }

        //completion(.success(coins))
    }
}
