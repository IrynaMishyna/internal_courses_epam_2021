//
//  CardCell.swift
//  HW - 6 Memory game
//
//  Created by Iryna Mishyna on 20.10.2021.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CardCell"
    
    // MARK: - Properties
    private var frontImageView = UIImageView()
    private var backImageView = UIImageView()
    
    var card: Card?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialSetup()
    }
    
    private func initialSetup() {
        
        contentView.addSubview(frontImageView)
        contentView.addSubview(backImageView)
        
        frontImageView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            frontImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            frontImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frontImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            frontImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    func configureCell(card:Card) {
        
        self.card = card
        
        // Set the frontImageView and frontImageView
        frontImageView.image = UIImage(named: card.imageName)
        backImageView.image = UIImage(named: "card")
        
        frontImageView.layer.cornerRadius = 5.0
        backImageView.layer.cornerRadius = 5.0
        
        frontImageView.layer.masksToBounds = true
        backImageView.layer.masksToBounds = true
        
        // Reset the state of the cell
        if card.isEqual == true {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        }
        else {
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        if card.isFlipped == true {
            
            cardflip(speed: 0)
        }
        else {

            cardFlipDown(speed: 0, delay: 0)
        }
    }
    
    func cardflip(speed:TimeInterval = 0.3) {
        
        UIView.transition(from: backImageView,
                          to: frontImageView,
                          duration: speed,
                          options: [.showHideTransitionViews,.transitionFlipFromLeft],
                          completion: nil)
        
        card?.isFlipped = true
    }
    
    func cardFlipDown(speed:TimeInterval = 0.3, delay:TimeInterval = 0.5) {
        
        card?.isFlipped = false
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            
            UIView.transition(from: self.frontImageView,
                              to: self.backImageView,
                              duration: speed,
                              options: [.showHideTransitionViews,.transitionFlipFromLeft],
                              completion: nil)
        }
    }
    
    func remove() {
        
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: .curveEaseOut,
                       animations: {
            
            self.frontImageView.alpha = 0
            
        }, completion: nil)
    }

}


