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
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.myCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
       // let booksToSet = populateCell[indexPath.row]
        //cell.bookImage.image! = booksToSet.book_details[0].
//        cell.textLabel.text! = booksToSet.book_details[0].author
        cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let bookToSet = bookData[indexPath.row]
//        let detailed = DetailedViewController.init(isbn: bookToSet.book_details[0].primary_isbn13, description: bookToSet.book_details[0].description, bookName: bookToSet.book_details[0].title, bookAuthor: bookToSet.book_details[0].author)
//        navigationController?.pushViewController(detailed, animated: true)
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
        let category = bookData[row].list_name
        BookDataAPIClient.getData(category: category) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data{
                dump(data)
            }
        }
    }
}
