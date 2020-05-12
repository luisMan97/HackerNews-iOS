//
//  NewsInteractor.swift
//  HackerNewsColegium
//
//  Created by jennifer hasblady anzola ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsInteractor: NewsInputInteractorProtocol {
    
    weak var presenter: NewsOutputInteractorProtocol?
    
    private let manager = APIManager()
    
    func getNewsList() {
        manager.callServiceObject(service: .Hits) { [weak self] (data, error) in
            guard let strongSelf = self else {
                self?.presenter?.error(nil)
                return
            }
            
            if let error = error {
                strongSelf.presenter?.error(error)
            } else if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let hits = try jsonDecoder.decode(Hits.self, from: data)
                    strongSelf.presenter?.newsListDidFetch(hits.hits ?? [New]())
                    print("getNewsList JSON \(hits.hits ?? [New]())")
                } catch let jsonError {
                    let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                    strongSelf.presenter?.error(error)
                }
            } else {
                strongSelf.presenter?.error(error)
            }
        }
    }

}
