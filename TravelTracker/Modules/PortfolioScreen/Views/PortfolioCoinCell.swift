//
//  PortfolioCoinCell.swift
//  Created by Алексей on 10.02.2025.
//

import UIKit
import SnapKit

final class PortfolioCoinCell: UITableViewCell {
    
    private lazy var coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "bg")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(coinImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        coinImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(coinImageView.snp.trailing).offset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(nameLabel.snp.trailing).offset(8)
        }
    }
    
    func configure(with coin: PortfolioModel.Coin) {
        nameLabel.text = coin.name
        priceLabel.text = "$\(coin.priceUSD)"
        coinImageView.image = UIImage(named: coin.imageUrl) ?? UIImage(systemName: "bitcoinsign.circle")
    }
}
