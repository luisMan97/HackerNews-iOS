//
//  NewPresenter.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewDetailPresenter {
    
    weak var view: NewDetailViewProtocol?
    var routing: NewRouting?
    var new: New?
    
    func getNew() {
        if let new = new {
            view?.showTitleAndWebView(new)
        }
    }

}
