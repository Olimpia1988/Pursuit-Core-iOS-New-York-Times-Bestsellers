//
//  DetailedViewController.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var isbn = String()
    var bookDescription = String()
    var bookTitle = String()
    
    let detailedView = DetailedView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.addSubview(detailedView)
      
    }
    
    init(isbn: String, description: String, bookName: String, bookAuthor: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn = isbn
        self.bookDescription = description
        self.bookTitle = bookName
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
