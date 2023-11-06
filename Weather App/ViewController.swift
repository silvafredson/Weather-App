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
        label.textColor = UIColor.color.bluePrimaryColor
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setupViews() {
        view.backgroundColor = .cyan
        setUpHierahcy()
        setUpConstraints()
    }
    
    private func setUpHierahcy() {
        view.addSubview(backgroundView)
        view.addSubview(rectangleView)
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
    }

}

