//
//  NewViewController.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewDetailViewController: UIViewController {
    
    var presenter: NewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getNew()
    }
    
}

extension NewDetailViewController: NewDetailViewProtocol {
    
    func showTitleAndWebView(_ new: New) {
        title = new.title != nil ? new.title : new.storyTitle
    }
    
}
