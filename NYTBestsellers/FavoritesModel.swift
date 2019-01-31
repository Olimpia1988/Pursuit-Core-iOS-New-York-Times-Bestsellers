//
//  FavoritesModel.swift
//  NYTBestsellers
//
//  Created by Olimpia on 1/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoriteBookModel {
    private static let filename = "NYTimesBestseller.plist"
    
    private static var bestsellerBooks = [FavoriteBook]()
    
    static func getBook() -> [FavoriteBook] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
            do {
               bestsellerBooks = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
            } catch {
                print("Porperty list encoder : \(error)")
            }
        } else {
            print("Data is nil")
        }
        } else {
            print("\(filename) does not exist")
        }
//        bestsellerBooks = bestsellerBooks.sorted {$0.date > $1.date}
//        return bestsellerBooks
        return bestsellerBooks
    }
    
    private init() {}
    
    static func saveBook() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
         let data = try PropertyListEncoder().encode(bestsellerBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoder error: \(error)")
        }
    }
    
    static func editPhotos(book: FavoriteBook, atIndex index: Int) {
        bestsellerBooks.remove(at: index)
        bestsellerBooks.insert(book, at: index)

    }
    
    static func addBook(book: FavoriteBook) {
        bestsellerBooks.append(book)
        saveBook()
    }
    
    static func deleteFromSetting(atIndex index: Int) {
        bestsellerBooks.remove(at: index)
        saveBook()
    }
    
    static func update(book: FavoriteBook, index: Int) {
        bestsellerBooks[index] = book
        saveBook()
    }
}
