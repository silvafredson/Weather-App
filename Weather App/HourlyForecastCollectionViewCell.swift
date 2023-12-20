//
//  HourlyForecastCollectionViewCell.swift
//  Weather App
//
//  Created by Fredson Silva on 08/11/23.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let idenfier = "HourlyForecast"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel, imagewView, temperatureLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = Colors.whiteColorContrast?.cgColor
        stackView.layer.cornerRadius = 12
        return stackView
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13h00"
        label.textColor = Colors.whiteColorContrast
        label.font = UIFont.systemFont(ofSize: 10, weight:  .semibold)
        label.textAlignment = .center
        return label
    }()    
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25ºC"
        label.textColor = Colors.whiteColorContrast
        label.font = UIFont.systemFont(ofSize: 14, weight:  .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imagewView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(named: "daylight")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        setUpHierarchy()
        setUpConstraints()
    }
    private func setUpHierarchy() {
        contentView.addSubview(stackView)
    }
    private func setUpConstraints() {
        stackView.setUpConstraintsToParents(contentView)
        NSLayoutConstraint.activate([
            imagewView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
