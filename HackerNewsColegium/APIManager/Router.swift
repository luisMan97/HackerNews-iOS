//
//  Router.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

enum Router {
    
    case Hits
    
    private var method: String {
        switch self {
        case .Hits:
            return "GET"
        }
    }
    
    private var path: String {
        switch self {
        case .Hits:
            return "search_by_date?query=ios"
        }
    }
    
    var request: URLRequest? {
        switch self {
        case .Hits:
            
            guard let url = NSURL(string: ApiManagerConstants.keys.endpoint + path) else {
                return nil
            }
            var mutableURLRequest = URLRequest(url: url as URL)
            mutableURLRequest.httpMethod = method
            
            return mutableURLRequest
        }
    }
}
