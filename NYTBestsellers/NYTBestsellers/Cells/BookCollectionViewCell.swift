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
        textLabel.textAlignment = .center
    
          return textLabel
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.textAlignment = .center
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(bookImage)
        addSubview(textLabel)
        addSubview(textView)
       imageConstraints()
        labelConstraint()
        textViewConstraint()
    }
    
    
    private func imageConstraints(){
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        bookImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        bookImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        bookImage.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    private func labelConstraint(){
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        [textLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 8),
         textLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 10),  textLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11), textLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)].forEach{ $0.isActive = true }
       
    }
    
    private func textViewConstraint(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 8).isActive = true
        textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        textView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
