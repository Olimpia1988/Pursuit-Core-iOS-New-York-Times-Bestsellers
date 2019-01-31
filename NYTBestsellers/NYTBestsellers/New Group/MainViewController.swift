//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    var populateCell = [BookGeneralInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.myCollectionView.reloadData()
            }
        }
    }
    
    var bookData = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.pickerView.reloadAllComponents()
            }
        }
    }
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        view.backgroundColor = .white
        mainView.myCollectionView.dataSource = self
        mainView.myCollectionView.delegate = self
        mainView.pickerView.dataSource = self
        mainView.pickerView.delegate = self
        self.mainView.myCollectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCell")
        giveUsTheData()
        
    }
    
    private func giveUsTheData() {
        BookCathegoryApiClient.getBookData { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                self.bookData = data
            }
            
        }
    }
    
    private func dataBooks(keyword: String) {
        BookDataAPIClient.getData(category: keyword.replacingOccurrences(of: " ", with: "-")) { (appError, data) in
            if let appError = appError {
                print(appError)
            } else if let data = data {
                self.populateCell = data
            }
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return populateCell.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //this is my cell to set up the detailed view!!
        
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? BookCollectionViewCell else { return }
        
        let selectedBook = SelectedBookModel.init(imageToSet: cell.bookImage.image!, titleToSet: cell.textLabel.text!, descriptionToSet: cell.textView.text)
//        cell.textLabel.text
        
        let detail = DetailedViewController.init(selectedBook: selectedBook)
         navigationController?.pushViewController(detail, animated: true)
        

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.myCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
      
        let booksToSet = populateCell[indexPath.row]
        cell.textLabel.text! = "Weeks on List \(booksToSet.weeks_on_list)"
        cell.textView.text = booksToSet.book_details.first?.description
        cell.backgroundColor = .white 
        
        GoogleAPIClient.getDataFromGoogle(keyword: booksToSet.book_details.first!.primary_isbn13) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                
                let image = data[0].volumeInfo.imageLinks.thumbnail
                
                DispatchQueue.main.async {
                    if let imageData =  ImageHelper.fetchImageFromCache(urlString: image) {
                        DispatchQueue.main.async {
                             cell.bookImage.image = imageData
                        }
                       
                    } else {
                        ImageHelper.fetchImageFromNetwork(urlString: image, completion: { (appError, image) in
                            if let appError = appError {
                                print(appError)
                            }
                            if let image = image {
                                DispatchQueue.main.async {
                                      cell.bookImage.image = image
                                }
                              
                            }
                        })
                    }
                }
            }
        }
        return cell
    }
        
        
    
    

            }
    
extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return bookData[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataBooks(keyword: bookData[row].list_name)
    }
}
