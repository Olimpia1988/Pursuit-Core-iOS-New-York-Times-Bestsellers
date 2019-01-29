//
//  BookDataAPIClient.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class BookDataAPIClient {
    
    
    static func getData(category: String, completionHandler: @escaping(AppError?, [BookGeneralInfo]?) -> Void) {
        let categoryNameForatted = category.replacingOccurrences(of: " ", with: "-")
        
        let stringURL = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(Constants.nytKey)&list=\(categoryNameForatted)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: stringURL) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookInfo = try JSONDecoder().decode(NYTBestSellersModel.self, from: data)
                    completionHandler(appError, bookInfo.results )
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        
       
    }
}
