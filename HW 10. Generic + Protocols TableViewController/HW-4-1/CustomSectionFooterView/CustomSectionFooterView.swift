//
//  CustomSectionFooterView.swift
//  HW-4-1
//
//  Created by Iryna Mishyna on 13.10.2021.
//

import UIKit

class CustomSectionFooterView: UITableViewHeaderFooterView {
    
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "Earth")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpSubviews()
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubviews() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
    }
    
    func setUpAutoLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
}
