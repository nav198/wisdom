//
//  ViewController.swift
//  wisdomLeaf_Task
//
//  Created by admin on 24/06/24.
//

import UIKit

class LaunchViewController: UIViewController {
    

    let leafImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 125
        imageView.image = UIImage(named: "leaf")
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageProps()
        navigateToMainScreen()
    }
    
    // MARK: Image Properties
    func setupImageProps(){
        view.addSubview(leafImageView)
        NSLayoutConstraint.activate([
            leafImageView.widthAnchor.constraint(equalToConstant: 250),
            leafImageView.heightAnchor.constraint(equalToConstant: 250),
            leafImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            leafImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: Navigate to Dashboard
    func navigateToMainScreen(){
        let vc = DashboardViewController()
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }

}

