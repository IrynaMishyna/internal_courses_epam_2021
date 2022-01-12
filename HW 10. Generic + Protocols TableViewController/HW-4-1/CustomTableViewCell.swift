//
//  CustomTableViewCell.swift
//  HW-4-1
//
//  Created by Iryna Mishyna on 08.10.2021.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var cellDescriptionButton: UIButton!
    @IBOutlet weak var cellDescriptionLabel: UILabel!
    
    var expandCallback: ((CustomTableViewCell) -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
        cellTextLabel.text = nil
        cellDescriptionLabel.text = nil
        cellDescriptionLabel.isHidden = true
        expandCallback = nil
    }
    
    func configure(with country: Country) {
        
        cellTextLabel.text = country.name
        cellImageView.image = UIImage(named: country.imageName)
        cellDescriptionLabel.isHidden = !country.isExpanded
        cellDescriptionLabel.text = country.description
    }
    
    @IBAction func cellDescriptionButtonAction() {
        expandCallback?(self)
    }
}
