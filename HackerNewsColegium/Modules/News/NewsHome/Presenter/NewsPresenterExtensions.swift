//
//  NewsPresenterExtensions.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension NewsPresenter: NewsOutputInteractorProtocol {
    
    func newsListDidFetch(_ newsList: [New]) {
        view?.showNews(newsList)
    }
    
    func error(_ error: Error?) {
        view?.showError(error)
    }
    
}
