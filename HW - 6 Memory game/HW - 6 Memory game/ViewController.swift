//
//  ViewController.swift
//  HW - 6 Memory game
//
//  Created by Iryna Mishyna on 20.10.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIdentifier)
        
        return view
    }()
    
    let interItemSpacing: CGFloat = 10
    let cellsInRow: CGFloat = 4
    
    var model = CardModel()
    
    var firstFlippedCardIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        
        collectionView.delegate = self
        collectionView.dataSource = self

        view.addSubview(collectionView)
        
        collectionView.contentInset = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    }
    
    private func setUpAutoLayout() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //MARK: - Game logic methods
    
    func checkForMatch(_ secondFlippedCardIndex:IndexPath) {
        
        // get two card for two Index and see match
        guard let firstFlippedCardIndex = firstFlippedCardIndex else { return }

        let cardOne = model.cardsArray[firstFlippedCardIndex.row]
        let cardTwo = model.cardsArray[secondFlippedCardIndex.row]
        
        // Get the two collection view cells for cards
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex) as? CardCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCell
        
        // equal cards
        if cardOne.imageName == cardTwo.imageName {
            
            //match
            cardOne.isEqual = true
            cardTwo.isEqual = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
        } else {
            
            //not match
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.cardFlipDown()
            cardTwoCell?.cardFlipDown()
        }
        
        // reset the firstFlippedCardIndex property
        self.firstFlippedCardIndex = nil
    }
}

//MARK: - Protocol Methods

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseIdentifier, for: indexPath) as? CardCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // Configure the state of the cell based on the properties of the Card that it represents
        let cardCell = cell as? CardCell
        
        // Get the card from the card array
        let card = model.cardsArray[indexPath.row]
        
        // Finish configuring the cell
        cardCell?.configureCell(card: card)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCell,
        let card = cell.card else {return}
    
                
        if !card.isFlipped && !card.isEqual {
            
            cell.cardflip()
            
            // Check if this is the first card that was flipped or the second card
            if firstFlippedCardIndex == nil {
                
                //first card flipped over
                firstFlippedCardIndex = indexPath
            }
            else {
                
                checkForMatch(indexPath)
            }
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let minimumSpacing = interItemSpacing
        let sectionInsets = (flowLayout?.sectionInset.left ?? 0) + (flowLayout?.sectionInset.right ?? 0)
        let sideInsets = collectionView.contentInset.left + collectionView.contentInset.right
        let totalSpace = sideInsets + sectionInsets + minimumSpacing * (cellsInRow - 1)
        let width = (collectionView.frame.width - totalSpace) / cellsInRow
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
        
    }
    
}
