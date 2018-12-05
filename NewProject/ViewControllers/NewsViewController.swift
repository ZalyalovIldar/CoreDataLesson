//
//  NewsViewController.swift
//  NewProject
//
//  Created by Гузель on 03.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var somePostArray: [PostObject] = []
    var refreshControl: UIRefreshControl?
    var identifier1 = "cell"
    var segueIdentifier = "postDetailIdentifier"
    
    var dataManager: DataManager!
    
    // MARK: - Методы -
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        dataManager = DataManagerImplementation.sharedInstance
        
        tableView.estimatedRowHeight = 400
        tableView.tableFooterView = UIView()

        // проверка в консоли
        let predicate = NSPredicate(format: "id == %ld", 9)
        let searchResult = dataManager.get(with: PostObject.self, predicate: predicate)
        print(searchResult?.first?.name)
        reloading()
        pullToRefresh()
    }
    
    func pullToRefresh(){
        
        //pull-to-refresh
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action:  #selector(reloading), for: UIControlEvents.valueChanged)
    }

    
    /// обновление данных
    @objc func reloading() {

        self.somePostArray = dataManager.get(with: PostObject.self, predicate: nil) ?? []
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
    
    // MARK: - funcs of TableView -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return somePostArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier1) as! CustomTableViewCell
        
        cell.addingContent(post: (self.somePostArray[indexPath.row]), controller: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == .delete {
            dataManager.delete(managedObject: somePostArray[indexPath.row])
            self.reloading()

        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueIdentifier {
            
            if let nextVC = segue.destination as? PostDetailViewController {
                
                nextVC.mainViewController = self
                nextVC.selectedIndex = tableView.indexPathForSelectedRow?.row
            }
        }
    }
    
    /// Добавление рандомного поста
    ///
    /// - Parameter sender: Any sender
    @IBAction func addNewPost(_ sender: Any) {
        let postObject = PostObject(context: dataManager.getContext())
        postObject.id = Int16(arc4random_uniform(UInt32(1000)))
        postObject.name =  "\(Int(arc4random_uniform(UInt32(1000))))"
        postObject.avatar = UIImagePNGRepresentation(#imageLiteral(resourceName: "kitty"))! as NSData
        postObject.textDescription = "\(Int(arc4random_uniform(UInt32(10000000))))"
        postObject.someImage =  UIImagePNGRepresentation(#imageLiteral(resourceName: "kitty"))! as NSData
        dataManager.saveAll()
        self.reloading()
       
    }
}
