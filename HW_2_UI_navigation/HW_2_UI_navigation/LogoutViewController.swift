//
//  LogoutViewController.swift
//  HW_2_UI_navigation
//
//  Created by Iryna Mishyna on 14.09.2021.
//

import UIKit

class LogoutViewController: UIViewController {

    @IBAction func logoutButtonAction(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    deinit {
        print("🅰️")
    }
}
