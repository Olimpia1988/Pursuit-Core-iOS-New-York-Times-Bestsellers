//
//  SettingaView.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingaView: UIView {

    lazy var CathegoriesPickerView: UIPickerView = {
        let favpickerView = UIPickerView()
        return favpickerView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(CathegoriesPickerView)
        setPVConstrains()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPVConstrains() {
        CathegoriesPickerView.translatesAutoresizingMaskIntoConstraints = false
        [CathegoriesPickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11), CathegoriesPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11), CathegoriesPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11), CathegoriesPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5), CathegoriesPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11)].forEach{ $0.isActive = true }
        
    }
}
