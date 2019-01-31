//
//  BSAPIClient .swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class BookCathegoryApiClient {
    
    static func getBookData(completionHandler: @escaping(AppError?, [Results]?) -> Void) {
        
        let stringURL = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(Constants.nytKey)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: stringURL) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
        }
            if let data = data {
                do {
                   let bookData = try JSONDecoder().decode(BookModel.self, from: data)
                    completionHandler(appError, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
    }
}

}
