//
//  BookMode.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookModel: Codable {
    var copyright: String
    var results: [Results]
}

struct Results: Codable {
    var list_name: String
   
}




