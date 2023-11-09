//
//  ViewController.swift
//  Weather App
//
//  Created by Fredson Silva on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rectangleView: UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "João Pessoa"
        label.textAlignment = .center
        label.textColor = Colors.bluePrimaryColor
        return label
    }()   
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.text = "25ºC"
        label.textAlignment = .center
        label.textColor = UIColor(named: "bluePrimaryColor")
        return label
    }()
    
    private lazy var sunImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "daylight")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var humiditylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umidade"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = Colors.whiteColorContrast
        return label
    }()    
    
    private lazy var humidityValuelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000mm"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = Colors.whiteColorContrast
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humiditylabel, humidityValuelabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()    
    
    private lazy var windlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = Colors.whiteColorContrast
        return label
    }()    
    
    private lazy var windValuelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10km/h"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = Colors.whiteColorContrast
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windlabel, windValuelabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = Colors.SoftGray
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 15, trailing: 24)
        stackView.layer.cornerRadius = 12
        return stackView
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PREVISÃO POR HORA"
        label.textColor = Colors.whiteColorContrast
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var timeHorizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.idenfier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        setUpHierahcy()
        setUpConstraints()
    }
    
    private func setUpHierahcy() {
        view.addSubview(backgroundView)
        view.addSubview(rectangleView)
        view.addSubview(statsStackView)
        view.addSubview(hourlyForecastLabel)
        view.addSubview(timeHorizontalCollectionView)
        
        rectangleView.addSubview(cityLabel)
        rectangleView.addSubview(temperatureLabel)
        rectangleView.addSubview(sunImageView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view .bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            rectangleView.heightAnchor.constraint(equalToConstant: 169),
            rectangleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 59),
            rectangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            rectangleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
        ])
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            temperatureLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 26),
            //temperatureLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -117),
            //temperatureLabel.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -42)
            
            //sunImageView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 13),
            sunImageView.heightAnchor.constraint(equalToConstant: 86),
            sunImageView.widthAnchor.constraint(equalToConstant: 86),
            sunImageView.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            sunImageView.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -26),
            sunImageView.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.heightAnchor.constraint(equalToConstant: 67),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 30),
            hourlyForecastLabel.centerXAnchor.constraint(equalTo: statsStackView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            timeHorizontalCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22),
            //timeHorizontalCollectionView.widthAnchor.constraint(equalToConstant: 67),
            timeHorizontalCollectionView.heightAnchor.constraint(equalToConstant: 84),
            timeHorizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timeHorizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.idenfier, for: indexPath)
        return cell
    }
}
