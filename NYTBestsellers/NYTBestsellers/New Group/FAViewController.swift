//
//  FAViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FAViewController: UIViewController {
 
    let favView = FavoritesView()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(favView)
        favView.backgroundColor = .yellow
        favView.favoritesCV.delegate = self
        favView.favoritesCV.dataSource = self 
    self.favView.favoritesCV.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavCell")
   
    }
    
}

extension FAViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favView.favoritesCV.dequeueReusableCell(withReuseIdentifier: "FavCell", for: indexPath) as? FavoritesCell else { return UICollectionViewCell() }
        
        return cell 
    }
    
    
}



