//
//  NewsTableViewCell.swift
//  HackerNewsColegium
//
//  Created by jennifer hasblady anzola ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    
    var viewModel: NewViewModel! {
        didSet {
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    private func setup() {
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        createdAt.text = viewModel.createdAt
    }
    
}
