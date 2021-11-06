//
//  DetailsViewController.swift
//  HW2 TabBarController and UINavigationViewController
//
//  Created by Iryna Mishyna on 30.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0, green: 0, blue: 215, alpha: 1)

        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView  = UIImageView(frame:CGRect(x:30, y:50, width:250, height:100))
        imageView.image = UIImage(named:"kot-gruzitsja-6.jpeg")
        
        view.addSubview(imageView)

    }
}
