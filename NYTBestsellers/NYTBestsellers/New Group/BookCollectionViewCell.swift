//
//  BookCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    lazy var bookImage: UIImageView = {
        var bookCover = UIImageView()
let image = UIImageView(image: UIImage(named: "placeholder"))
        return image
    }()
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "weeks on best seller list"
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(bookImage)
        addSubview(textLabel)
        setConstrainsUp()
    }
    
    func setConstrainsUp () {
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        [bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), bookImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11), bookImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11), bookImage.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: 11), bookImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: 0.3)].forEach{ $0.isActive = true }
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        [textLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 11), textLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11), textLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11), textLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11)].forEach{ $0.isActive = true }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
