//
//  DashboardTableViewCell.swift
//  wisdomLeaf_Task
//
//  Created by admin on 24/06/24.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
//    let authorType: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = UIColor.black.withAlphaComponent(0.7)
//        label.numberOfLines = 0
//        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
//        return label
//    }()
    
    let checkboxButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "rectangle"), for: .normal)
        return btn
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(checkboxButton)
        
        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            mainImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),

            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: checkboxButton.leadingAnchor, constant: 20),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            checkboxButton.heightAnchor.constraint(equalToConstant: 30),
            checkboxButton.widthAnchor.constraint(equalToConstant: 30),
            checkboxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkboxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           
        ])
//        checkboxButton.layer.cornerRadius = 15
    }

}
