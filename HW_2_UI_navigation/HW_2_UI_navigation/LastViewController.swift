//
//  LastViewController.swift
//  HW_2_UI_navigation
//
//  Created by Iryna Mishyna on 14.09.2021.
//

import UIKit

class LastViewController: UIViewController {
    
    var goHomeAction: (() -> Void)?

    @IBAction func homeButtonAction(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: false)
        goHomeAction?()
    }
}
