//
//  NewDetailVCExtension.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension NewDetailViewController: NewDetailViewProtocol {
    
    func showTitleAndWebView(_ new: New) {
        title = new.title != nil ? new.title : new.storyTitle
        
        guard let urlString = new.storyUrl,
            let url = URL(string: urlString) else { return }
        newWKWebView.load(URLRequest(url: url))
    }
    
}
