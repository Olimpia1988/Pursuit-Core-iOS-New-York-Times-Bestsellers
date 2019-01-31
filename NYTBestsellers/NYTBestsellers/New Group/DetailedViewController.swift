//
//  DetailedViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var bookCoverImage: [BookGeneralInfo]!
    let detailedView = DetailedView()
    var book: SelectedBookModel!
    var favoriteBookToSet: [FavoriteBook]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailedView)
        detailedView.delegate = self
        //updateUI()
        configureNavBar()
        
    }
    
    
    
    private func configureNavBar() {
        
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorites", style: .plain, target: self, action: #selector(updateeDefaultSeach))
        
    }
    
    @objc private func updateeDefaultSeach() {
        let alertController = UIAlertController(title: "Added to Favorites", message: " ", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "OK", style: .default) { (alert) in
            let description = self.book.descriptionToSet
            let imageData = self.detailedView.bookPicture.image?.jpegData(compressionQuality: 0.5)
            let favorite = FavoriteBook.init(createdAt: Date.getISOTimestamp(), imageData: imageData!, description: description)
            self.detailedView.delegate?.didSaveFavorite(favorite: favorite)
            
            
            
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        present(alertController, animated: true)
        
//       @objc
//    func favoriteButtonBeingTapped(_ sender: UIBarButtonItem!) {
//       let weeks = book.weeks_on_list.description
//       // let bookDescription = descriptionFromGoogle
//
//        let favoriteBookToPass = FavoriteBook.init(createdAt: Date.getISOTimestamp(), imageData: (imageDataInstance?.jpegData(compressionQuality: 0.5))!, description: bookDescription, weeksOnBestSellerList: weeks)
//
//        FavoriteBookModel.addBook(book: favoriteBookToPass)
        
        
       // }
    }
    
    init(selectedBook: SelectedBookModel) {
        super.init(nibName: nil, bundle: nil)
        self.book = selectedBook
        detailedView.setUp(book: selectedBook)
        
      // book = selectedBook
        // OBJECT TO SEND
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
//    private func updateUI() {
//        detailedView.authorLabel.text = book.book_details.first!.author
//        detailedView.descriptionTextView.text = """
//        Sumary:
//        \(book.book_details.first!.description)
//        """
//
//        let imageToSet = book.book_details.first!.primary_isbn13
//
//        GoogleAPIClient.getDataFromGoogle(keyword: imageToSet) { (appError, data) in
//            if let appError = appError {
//                print(appError)
//            }
//            if let data = data {
//                let image = data[0].volumeInfo.imageLinks.thumbnail
//                DispatchQueue.main.async {
//                    if let bookPicture = ImageHelper.fetchImageFromCache(urlString: image) {
//                        DispatchQueue.main.async {
//                            self.detailedView.bookPicture.image = bookPicture
//                        }
//                    } else {
//                        ImageHelper.fetchImageFromNetwork(urlString: image, completion: { (appError, data) in
//                            if let appError = appError {
//                                print(appError)
//                            }
//
//                        })
//                    }
//                }
//            }
//        }
//
//    }
//
    
}

extension DetailedViewController: FavoritesDelegate {
    func didSaveFavorite(favorite: FavoriteBook) {
        FavoriteBookModel.addBook(book: favorite)
    }
    
    
}
