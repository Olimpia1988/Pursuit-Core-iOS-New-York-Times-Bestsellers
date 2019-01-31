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
    
    var favoriteData = [FavoriteBook]() {
        didSet {
            favView.favoritesCV.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
        
    }
    
    func loadFavorites() {
        favoriteData = FavoriteBookModel.getBook()
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(favView)
        loadFavorites()
        favView.backgroundColor = .yellow
        favView.favoritesCV.delegate = self
        favView.favoritesCV.dataSource = self 
    self.favView.favoritesCV.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavCell")
   
    }
    
}

extension FAViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favView.favoritesCV.dequeueReusableCell(withReuseIdentifier: "FavCell", for: indexPath) as? FavoritesCell else { return UICollectionViewCell() }
        
        let fave = favoriteData[indexPath.row]
       // cell.bookTitulo = fave.
        cell.bookTitulo.text = fave.createdAt
        cell.bookPortada.image = UIImage(data: fave.imageData)
        return cell 
    }
    
    
}



