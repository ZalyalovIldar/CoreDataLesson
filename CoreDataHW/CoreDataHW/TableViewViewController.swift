//
//  TableViewViewController.swift
//  homework2
//
//  Created by itisioslab on 03.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataManager: CoreDataManagerProtocol!
    
    var news : [News]!
    let idintifier = "detailSegue"
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addNewNews(_ sender: Any) {
        dataManager.getAndSaveRandomNews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 300
        tableView.addSubview(refreshControl)
        
        dataManager = CoreDataManager.dbManager
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataManager.asyncGetAll(with: News.self) {[weak self] (news) in
            
            if let strong = self {
                strong.news = news
                strong.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.configureCell(with: news[indexPath.row].name!, vc: self, model: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (news?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:idintifier, sender: news[indexPath.row])
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        dataManager.asyncGetAll(with: News.self) {[weak self] (news) in
            
            if let strong = self {
                
                strong.news = strong.dataManager.getAll(with: News.self)
                strong.tableView.reloadData()
                strong.refreshControl.endRefreshing()
            }
        }
    
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue", let news = sender as? News {
            
            if let destinationVC = segue.destination as? NewsViewController {
                destinationVC.news = news
            }
        }
    }
    

}
