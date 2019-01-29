//
//  FavoritesCell.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
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
        gimeMeConstrains()
        backgroundColor = #colorLiteral(red: 0.832047224, green: 0.7320680618, blue: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gimeMeConstrains() {
        bookPortada.translatesAutoresizingMaskIntoConstraints = false
        [bookPortada.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11), bookPortada.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11),bookPortada.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11), bookPortada.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)].forEach{ $0.isActive = true }
        
        bookTitulo.translatesAutoresizingMaskIntoConstraints = false
        [bookTitulo.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), bookTitulo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true }
    }
    
   

}
