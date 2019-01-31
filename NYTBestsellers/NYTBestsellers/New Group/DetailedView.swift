//
//  DetailedView.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol FavoritesDelegate: AnyObject {
    func didSaveFavorite(favorite: FavoriteBook)
}

class DetailedView: UIView {
    
    weak var delegate: FavoritesDelegate?
  
    
    lazy var amazonButton: UIButton = {
        let amazonButton = UIButton()
     //amazonButton.backgroundImage(for: <#T##UIControl.State#>)
      amazonButton.setTitle("Amazon", for: .normal)
        return amazonButton
    }()

    lazy var bookPicture: UIImageView = {
        let imageCover = UIImageView()
        let picture = UIImageView(image: UIImage(named: "placeholder"))
       picture.contentMode = .scaleAspectFit
        return picture
    }()
    
    lazy var authorLabel: UILabel = {
        let autorLabel = UILabel()
        autorLabel.backgroundColor = #colorLiteral(red: 0.8467837572, green: 0.9415003657, blue: 1, alpha: 1)
        autorLabel.textAlignment = .center
        autorLabel.sizeToFit()
        return autorLabel
    }()
    
    lazy var descriptionTextView: UITextView = {
        let descTextView = UITextView()
        descTextView.backgroundColor = #colorLiteral(red: 1, green: 0.8526156545, blue: 0.9421479106, alpha: 1)
        descTextView.textAlignment = .center
        descTextView.adjustsFontForContentSizeCategory = true
        descTextView.sizeToFit()
        descTextView.font = UIFont(name: "arial", size: 24)
        return descTextView
        
    }()
    
    lazy var favoritesButton: UIBarButtonItem = {
        let favoritesButton = UIBarButtonItem()
        var favBut = UIBarButtonItem(title: "Favorites", style: .plain, target: self, action: #selector(addStuffUp))
       
    return favoritesButton
        
    }()
    
    @objc func addStuffUp() {
        
        
    }
    
    func setUp(book: SelectedBookModel) {
        authorLabel.text = book.titleToSet
        descriptionTextView.text = book.descriptionToSet
        bookPicture.image = book.imageToSet
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(bookPicture)
        addSubview(authorLabel)
        addSubview(descriptionTextView)
        addSubview(amazonButton)
//        addSubview(favoritesButton)
        constrainsSetUp()
        backgroundColor = .white
    }
    
    func constrainsSetUp() {
        bookPicture.translatesAutoresizingMaskIntoConstraints = false
        [bookPicture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22
            ), bookPicture.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),bookPicture.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),bookPicture.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50), bookPicture.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach{ $0.isActive = true }
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        [authorLabel.topAnchor.constraint(equalTo: bookPicture.bottomAnchor, constant: 11), authorLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22), authorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22), ].forEach{ $0.isActive = true } //make changes to the bottom anchor
        
        //just in case 
        //authorLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11)
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        [descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22), descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22), descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11), descriptionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)].forEach{ $0.isActive = true }
        
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        [amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),
        amazonButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            amazonButton.leadingAnchor.constraint(equalTo: bookPicture.trailingAnchor, constant: 8)].forEach{$0.isActive = true}
    }
    
    
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


