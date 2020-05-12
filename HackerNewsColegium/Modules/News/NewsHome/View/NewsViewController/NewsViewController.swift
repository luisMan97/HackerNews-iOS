//
//  ViewController.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var containerView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
    
    var newsView: NewsView!
    
    var presenter: NewsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        setupNewsView()
    }
    
    private func setupNewsView() {
        newsView = NewsView(frame: view.frame, newsData: NewsData(news: [New]()))
        newsView.goToNewDetail = goToNewDetail
        newsView.getData = getData
        view.addSubview(newsView)
    }
    
    func goToNewDetail(_ new: New) -> () {
        presenter?.showNewSelection(with: new, from: self)
    }
    
    func getData() -> () {
        presenter.loadNews()
    }

}
