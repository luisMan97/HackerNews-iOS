//
//  NewsPresenter.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsPresenter {
    
    weak var view: NewsViewProtocol?
    var interactor: NewsInputInteractorProtocol?
    var routing: NewsRouting?
    
    func loadNews() {
        interactor?.getNewsList()
    }
    
    func showNewSelection(with new: New, from view: UIViewController) {
        routing?.pushToNewDetail(with: new, from: view)
    }

}
