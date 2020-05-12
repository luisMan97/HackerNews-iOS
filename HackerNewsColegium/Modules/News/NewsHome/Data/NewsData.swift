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
    
}
