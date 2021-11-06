//
//  NextViewController.swift
//  HW_2_UI_navigation
//
//  Created by Iryna Mishyna on 14.09.2021.
//

import UIKit

class NextViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let lastViewController = segue.destination as? LastViewController else {
            return
        }
        
        lastViewController.goHomeAction = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    deinit {
        print("☢️")
    }
}
