//
//  MainView.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainView: UIView {
   

   lazy var myCollectionView: UICollectionView = {
            //CREATE THE LAYOUT:
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize.init(width: 200, height: 275)
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
            let cv = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
            cv.backgroundColor = #colorLiteral(red: 0.8467837572, green: 0.9415003657, blue: 1, alpha: 1)
            return cv
    }()
    
    lazy var pickerView: UIPickerView = {
        let bookPickerView = UIPickerView()
       
        
     return bookPickerView
        
    }()
    
    
    

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
          addSubview(myCollectionView)
        addSubview(pickerView)
           setConstrains()
        myCollectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCell")
      
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), myCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), myCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), myCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach{$0.isActive = true }
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
       [pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0), pickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), pickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach{ $0.isActive = true }
    }
}


