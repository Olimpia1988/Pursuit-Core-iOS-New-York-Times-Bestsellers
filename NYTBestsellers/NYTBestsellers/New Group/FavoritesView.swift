//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
 
  
    lazy var favoritesCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 275)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let cv = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(favoritesCV)
        getMeConstrains()
        favoritesCV.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavCell")
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getMeConstrains() {
        favoritesCV.translatesAutoresizingMaskIntoConstraints = false
        [favoritesCV.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), favoritesCV.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), favoritesCV.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1.0), favoritesCV.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.0)].forEach{ $0.isActive = true }
    }
}





