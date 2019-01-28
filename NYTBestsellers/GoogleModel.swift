//
//  GoogleModel.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleData: Codable {
    var items: [BookItems]
}

struct BookItems: Codable {
  
    var selfLink: String
    var volumeInfo: VolumeInfo
    var saleInfo: SalesInfo
    var accessInfo: AccesInfo
    var searchInfo: SearchInfo
}

struct SalesInfo: Codable {
    var country: String
    var saleability: String
    var isEbook: Bool
}

struct AccesInfo: Codable {
    var country: String
    var viewability: String
    var embeddable: Bool
    var publicDomain: Bool
    var textToSpeechPermission: String
    
}

struct SearchInfo: Codable {
    var textSnippet: String 
}

struct VolumeInfo: Codable {
    var title: String
    var subtitle: String
    var authors: [String]
    var publisher: String
    var publishedDate: String
    var description: String
    var pageCount: Int
    var printType: String
    var categories: [String]
    var averageRating: Double
    var ratingsCount: Int
    var maturityRating: String
    var imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    var smallThumbnail: String
    var thumbnail: String
}




