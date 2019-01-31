//
//  GoogleAPIClient.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation



final class GoogleAPIClient {
    
    static func getDataFromGoogle(keyword: String, completionHandler: @escaping (AppError?, [BookItems]?) -> Void) {
        let googleEndPoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(keyword)&key=\(Constants.googleImageKey)"
     
     
        NetworkHelper.shared.performDataTask(endpointURLString: googleEndPoint) { (appError, data) in
            if let appError = appError {
                print(appError)
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                let googleDataToSet = try JSONDecoder().decode(GoogleData.self, from: data)
                    let items = googleDataToSet.items
                completionHandler(nil, items)
                } catch {
                    print(error)
                }
            }
        }
    }
}
