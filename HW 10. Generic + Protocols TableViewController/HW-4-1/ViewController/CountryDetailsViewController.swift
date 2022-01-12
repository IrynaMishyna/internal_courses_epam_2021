//
//  CountryDetailsViewController.swift
//  HW-4-1
//
//  Created by Iryna Mishyna on 04.11.2021.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    enum Constants {
        static let sizePadding: CGFloat = 20
        static let heightImage: CGFloat = 270
        
    }
    
    var country: Country?
    
    private lazy var countryNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var countryDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpSubviews()
        setUpAutoLayout()
        setupCountry()
    }
    
    private func setUpSubviews() {
        view.addSubview(countryNameLabel)
        view.addSubview(imageView)
        view.addSubview(countryDescriptionLabel)
    }
    
    private func setUpAutoLayout() {
        
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        countryDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            countryNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.sizePadding),
            countryNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sizePadding),
            countryNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sizePadding),

            
            imageView.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: Constants.sizePadding),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sizePadding),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sizePadding),
            imageView.heightAnchor.constraint(equalToConstant: Constants.heightImage),
            
            countryDescriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            countryDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sizePadding),
            countryDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sizePadding)
        ])
    }
    
    private func setupCountry () {
        guard let country = country else { return }
        
        countryNameLabel.text = country.name
        imageView.image = UIImage(named: country.imageName)
        countryDescriptionLabel.text = country.description
    }
}
