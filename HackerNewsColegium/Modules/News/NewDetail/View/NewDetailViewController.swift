//
//  NewDetailViewController.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import WebKit

class NewDetailViewController: UIViewController, WKUIDelegate {
    
    var presenter: NewDetailPresenter!
    var newWKWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addWKWebView()
        presenter.getNew()
    }
    
    private func addWKWebView() {
        newWKWebView = WKWebView(frame: view.frame, configuration: WKWebViewConfiguration())
        newWKWebView.uiDelegate = self
        newWKWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(newWKWebView)
    }
    
}
