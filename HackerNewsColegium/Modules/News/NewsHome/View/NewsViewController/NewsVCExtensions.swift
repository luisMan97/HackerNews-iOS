//
//  NewsVCExtensions.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension NewsViewController: NewsViewProtocol {
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func showNews(_ news: [New]) {
        newsView.newsData = NewsData(news: news)
        DispatchQueue.main.async {
            self.newsView.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error?) {
        if let error = error {
            presentAlertError(error)
        }
    }
    
}


