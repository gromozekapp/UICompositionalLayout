//
//  ExampleCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Daniil Zolotarev on 23.03.24.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    private let burgerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "burger1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Egg Top Burger"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.text = "$7.47"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview(burgerImageView)
        addSubview(backgroundTitleView)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    func configureCell(imageName: String) {
        burgerImageView.image = UIImage(named: imageName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            burgerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10)
        ])
    }
}
