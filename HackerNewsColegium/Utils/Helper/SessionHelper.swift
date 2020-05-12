//
//  SessionHelper.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class SessionHelper {
    
    static func getSession(key: String) -> AnyObject? {
        let userDefalts = UserDefaults.standard
        return userDefalts.value(forKey: key) as AnyObject
    }
    
}
