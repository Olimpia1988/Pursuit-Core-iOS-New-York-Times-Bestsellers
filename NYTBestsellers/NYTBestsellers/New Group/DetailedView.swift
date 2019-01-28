//
//  DetailedView.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedView: UIView {

    lazy var bookPicture: UIImageView = {
        let imageCover = UIImageView()
        let picture = UIImageView(image: UIImage(named: "placeholder"))
        return picture
    }()
    
    
    

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(bookPicture)
        constrainsSetUp()
    }
    
    func constrainsSetUp() {
        bookPicture.translatesAutoresizingMaskIntoConstraints = false
        [bookPicture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),bookPicture.centerXAnchor.constraint(equalTo: centerXAnchor), bookPicture.centerYAnchor.constraint(equalTo: centerYAnchor), bookPicture.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)].forEach{ $0.isActive = true }
    }
        
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


