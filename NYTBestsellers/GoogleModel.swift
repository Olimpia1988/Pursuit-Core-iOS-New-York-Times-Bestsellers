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
  var volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    var title: String

    var imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    var smallThumbnail: String
    var thumbnail: String
}




