//
//  NewsOutputInteractorProtocol.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

protocol NewsOutputInteractorProtocol: class {
    func newsListDidFetch(_ newsList: [New])
    func error(_ error: Error?)
}
