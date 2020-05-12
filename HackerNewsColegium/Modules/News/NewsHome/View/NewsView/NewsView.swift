//
//  NewsView.swift
//  HackerNewsColegium
//
//  Created by Jorge Luis Rivera Ladino on 11/05/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class NewsView: UIView {
    
    // MARK: Internal Properties
    
    var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = .white
        return tableview
    }()
    
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyStateView", owner: nil, options: [:])?.first as? UIView else {
            return UIView()
        }
        return view
    }()
    
    var newsData: NewsData!
    var refreshControl = UIRefreshControl()
    
    var goToNewDetail: ((New) -> ())?
    var getData: (() -> ())?
    
    // MARK: Initialization
    
    public init(frame: CGRect, newsData: NewsData) {
        super.init(frame: frame)
        self.newsData = newsData
        addSubview(tableView)
        setupTableView()
        setupRefreshControl()
        addConstraintsForTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    private func setupTableView() {
        tableView.register(NewsTableViewCell.nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func addConstraintsForTableView() {
        tableView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        getData?()
    }

}
