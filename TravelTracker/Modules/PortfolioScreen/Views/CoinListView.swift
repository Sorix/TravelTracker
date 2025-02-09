//
//  Created by Алексей on 09.02.2025.
//

import UIKit

extension PortfolioView {
    final class CoinCell: UITableViewCell {
        
        private let coinImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            return label
        }()
        
        private let priceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.textAlignment = .right
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            return label
        }()
        
        // Инициализация ячейки
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = UIColor(named: "bg")
            setupLayout()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupLayout() {
            contentView.addSubview(coinImageView)
            contentView.addSubview(nameLabel)
            contentView.addSubview(priceLabel)
            
            NSLayoutConstraint.activate([
                coinImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                coinImageView.widthAnchor.constraint(equalToConstant: 40),
                coinImageView.heightAnchor.constraint(equalToConstant: 40),
                
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 16),
                
                priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8)
            ])
        }
        
        func configure(with coin: CoinModel) {
            nameLabel.text = coin.name
            priceLabel.text = "$\(coin.priceUSD)"
            // Здесь можно загрузить изображение по URL, для примера используем локальное имя изображения
            coinImageView.image = UIImage(named: coin.imageUrl) ?? UIImage(systemName: "bitcoinsign.circle")
        }
    }
}


