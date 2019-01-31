//
//  FavoritesCell.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol FavoriteCellDelegate: AnyObject {
    func actionSheet()
}

class FavoritesCell: UICollectionViewCell {
    
    var delegate: FavoriteCellDelegate?
    
    lazy var settingsButton: UIButton = {
        let settingsButton = UIButton()
        settingsButton.setImage(UIImage(named: "icons8-button2"), for: .normal)
//        settingsButton.addTarget(self, action: #selector(actionSheet), for: .touchUpInside)
        settingsButton.setTitleColor(.black, for: .normal)
        return settingsButton
    }()
    
    @objc func actionSheet() {
        delegate?.actionSheet()
        
    }
    
    lazy var bookPortada: UIImageView = {
        var bookPortada = UIImageView()
        let image = UIImageView(image: UIImage(named: "placeholder"))
        return image
    }()
    
    lazy var bookTitulo: UILabel = {
       var bookTitulo = UILabel()
     bookTitulo.text = "Title goes here"
        return bookTitulo
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(bookPortada)
        addSubview(bookTitulo)
        addSubview(settingsButton)
        gimeMeConstrains()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gimeMeConstrains() {
        bookPortada.translatesAutoresizingMaskIntoConstraints = false
        [bookPortada.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11), bookPortada.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11),bookPortada.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11), bookPortada.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)].forEach{ $0.isActive = true }
        
        bookTitulo.translatesAutoresizingMaskIntoConstraints = false
        [bookTitulo.topAnchor.constraint(equalTo: bookPortada.bottomAnchor, constant: 22), bookTitulo.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11), bookTitulo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)].forEach{ $0.isActive = true }
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
        
    }
    
   


