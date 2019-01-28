//
//  STViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class STViewController: UIViewController {

   var stView = SettingaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .white
     view.addSubview(stView)
      stView.CathegoriesPickerView.dataSource = self
      stView.CathegoriesPickerView.delegate = self
    }
    


}

extension STViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Cathegories go here"
    }
    
    
}
