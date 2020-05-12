//
//  NewsRouting.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Ruvera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsRouting {
    
    private let viewController = NewsViewController()
    private let interactor = NewsInteractor()
    private let presenter = NewsPresenter()
    var navigationController: UINavigationController?
    
    init() {
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        viewController.presenter = presenter
        navigationController = UINavigationController(rootViewController: viewController)
    }
    
    func pushToNewDetail(with new: New, from view: UIViewController) {
        let newViewController = NewDetailViewController()
        NewDetailRouting.createNewModule(with: newViewController, and: new)
        view.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
