//
//  NewsViewProtocol.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

protocol NewsViewProtocol: class {
    func startLoading()
    func stopLoading()
    func showNews(_ news: [New])
    func showError(_ error: Error?)
}
