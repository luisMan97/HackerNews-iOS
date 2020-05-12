//
//  NewsInteractor.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
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
                if error.localizedDescription == "No internet connection" {
                    strongSelf.getSession()
                } else {
                    strongSelf.presenter?.error(error)
                }
            } else if let data = data {
                do {
                    let hits = try Hits.decode(data: data)
                    strongSelf.saveObject(hits: hits)
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
    
    private func saveObject(hits: Hits) {
        do {
            let data = try hits.encode()
            
            UserDefaults.standard.set(data, forKey: "Hits")
            UserDefaults.standard.synchronize()
        } catch let jsonError {
            let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
            print(error.localizedDescription)
        }
    }
    
    private func getSession() {
        if let data = SessionHelper.getSession(key: "Hits") as? Data {
            do {
                let hits = try Hits.decode(data: data)
                presenter?.newsListDidFetch(hits.hits ?? [New]())
            } catch let jsonError {
                let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                presenter?.error(error)
            }
        }
    }

}
