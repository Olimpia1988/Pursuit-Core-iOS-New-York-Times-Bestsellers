//
//  FAViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FAViewController: UIViewController, UIActionSheetDelegate {
 
    let favView = FavoritesView()
    
    var favoriteData = [FavoriteBook]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
        
    }
    
    func loadFavorites() {
        self.favView.favoritesCV.reloadData()
        self.favoriteData = FavoriteBookModel.getBook()
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(favView)
        loadFavorites()
        favView.backgroundColor = .white
        favView.favoritesCV.delegate = self
        favView.favoritesCV.dataSource = self 
    self.favView.favoritesCV.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavCell")
   
    }
    
    @objc func alertSheetUpdate(sender: UIButton) {
        let indexToSender = sender.tag
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .default) { (UIAlertAction) in
            FavoriteBookModel.deleteFromSetting(atIndex: indexToSender)
            self.loadFavorites()
            
            
        }
        action.addAction(delete)
        let canceAction = UIAlertAction(title: "Cancel", style: .cancel)
        action.addAction(canceAction)
        present(action, animated: true, completion: nil)
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
        cell.settingsButton.tag = indexPath.row
        cell.settingsButton.addTarget(self, action: #selector(alertSheetUpdate(sender:)), for: .touchUpInside)
        return cell 
    }
    
    
}



