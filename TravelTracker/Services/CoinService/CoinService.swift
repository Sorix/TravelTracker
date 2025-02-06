//
//  Created by Алексей on 06.02.2025.
//

protocol CoinServiceProtocol {
    func fetchCoins(completion: @escaping (Result<[CoinModel], Error>) -> Void)
}

class CoinService: CoinServiceProtocol {
    func fetchCoins(completion: @escaping (Result<[CoinModel], Error>) -> Void) {
        // Здесь можно реализовать запрос через URLSession, Alamofire и т.д.
        // Для демонстрации вернем статический список монет:
        let coins = [
            CoinModel(id: "btc", name: "Bitcoin", imageUrl: "btc_image", priceUSD: 30000),
            CoinModel(id: "eth", name: "Ethereum", imageUrl: "eth_image", priceUSD: 2000),
            CoinModel(id: "ltc", name: "Litecoin", imageUrl: "ltc_image", priceUSD: 150)
        ]
        completion(.success(coins))
    }
}
