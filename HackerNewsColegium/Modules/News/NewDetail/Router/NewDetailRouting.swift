//
//  NewViewRouting.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewDetailRouting {
    
    class func createNewModule(with newViewRef: NewDetailViewController, and new: New) {
        let presenter = NewDetailPresenter()
        presenter.new = new
        presenter.view = newViewRef
        presenter.routing = NewDetailRouting()
        newViewRef.presenter = presenter
    }

}
