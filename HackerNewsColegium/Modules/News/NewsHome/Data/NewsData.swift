//
//  NewsData.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class NewsData {
    
    var newsList: [New]
    
    var newsListCount: Int {
        return newsList.count
    }
    
    init(news: [New]) {
        newsList = news
    }
    
    func new(at index: Int) -> New? {
        guard index >= 0 && index < newsListCount else { return nil }
        return newsList[index]
    }
    
    func item(at indexPath: IndexPath) -> NewData {
        return NewData(new: newsList[indexPath.row])
    }
    
    func remove(at indexPath: IndexPath) {
        newsList.remove(at: indexPath.row)
        saveObject(news: newsList)
    }
    
    func saveObject(news: [New]) {
        do {
            let data = try news.encode()
            UserDefaults.standard.set(data, forKey: "News")
            UserDefaults.standard.synchronize()
        } catch let jsonError {
            let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
            print(error.localizedDescription)
        }
    }
    
}
