//
//  BSModel.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestSellersModel: Codable {
    
    let results: [BookGeneralInfo]
    
}

struct BookGeneralInfo: Codable {
    
    let weeks_on_list: Int
    let amazon_product_url: String //URL
    let book_details: [DetailedBookInfo]
    
}

struct DetailedBookInfo: Codable {
    let title: String
    let description: String
    let author: String
    let primary_isbn13: String
}
