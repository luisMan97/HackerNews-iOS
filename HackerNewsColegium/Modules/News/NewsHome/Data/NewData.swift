//
//  NewViewModel.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class NewData {
    
    private var new: New
    
    var title: String {
        return (new.title != nil ? new.title : new.storyTitle) ?? ""
    }
    
    var author: String {
        return new.author ?? ""
    }
    
    var createdAt: String {
        return new.createdAt ?? ""
    }
    
    init(new: New) {
        self.new = new
    }

}
