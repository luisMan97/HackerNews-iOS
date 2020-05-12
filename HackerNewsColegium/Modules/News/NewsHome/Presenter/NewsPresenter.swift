//
//  NewsPresenter.swift
//  HackerNewsColegium
//
//  Created by jennifer hasblady anzola ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsPresenter {
    
    weak var view: NewsViewProtocol?
    var interactor: NewsInputInteractorProtocol?
    var routing: Routing?
    
    func loadNews() {
        interactor?.getNewsList()
    }
    
    func showNewSelection(with new: New, from view: UIViewController) {
        routing?.pushToNewDetail(with: new, from: view)
    }

}

extension NewsPresenter: NewsOutputInteractorProtocol {
    
    func newsListDidFetch(_ newsList: [New]) {
        view?.showNews(newsList)
    }
    
    func error(_ error: Error?) {
        view?.showError(error)
    }
    
}
