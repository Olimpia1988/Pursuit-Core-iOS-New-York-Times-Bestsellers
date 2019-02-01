//
//  STViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class STViewController: UIViewController {
    
    var listName = FavoriteBookModel.getBook()

   var stView = SettingaView()
    
    var pickerViewSet = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.stView.CathegoriesPickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .white
     view.addSubview(stView)
        iWantTheData()
      stView.CathegoriesPickerView.dataSource = self
      stView.CathegoriesPickerView.delegate = self
        
    }
    
    func iWantTheData () {
        BookCathegoryApiClient.getBookData { (appError, data) in
            if let appError = appError {
                print(appError)
        }
            if let data = data {
                self.pickerViewSet = data
            }
        }
      }
    
    }
    




extension STViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewSet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return pickerViewSet[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(pickerViewSet[row].list_name, forKey: "categories")
    }
    
    // populate USER DEFAULTS
    
}
