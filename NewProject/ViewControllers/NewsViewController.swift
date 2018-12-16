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
    
    var postsArray: [PostObject] = []
    var refreshControl: UIRefreshControl?
    var identifier1 = "cell"
    var segueIdentifier = "postDetailIdentifier"
    
    var dataManager: DataManager!
    var mainService: MainService!
    
    let limit = 10
    
    // MARK: - Методы -
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        dataManager = DataManagerImplementation.sharedInstance
        mainService = MainServiceImplementation()
        
        tableView.estimatedRowHeight = 400
        tableView.tableFooterView = UIView()

      
        reloading()
        pullToRefresh()
        
        postsArray = dataManager.get(with: PostObject.self, predicate: nil) ?? []
        
        loadNews()
    }
    
    func pullToRefresh(){
        
        //pull-to-refresh
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action:  #selector(reloading), for: UIControlEvents.valueChanged)
    }

    
    /// обновление данных
    @objc func reloading() {

        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        }
   
    }
    
    // MARK: - funcs of TableView -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier1) as! CustomTableViewCell
        
        cell.addingContent(post: (self.postsArray[indexPath.row]), controller: self)
        
        return cell
    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == segueIdentifier {
//            
//            if let nextVC = segue.destination as? PostDetailViewController {
//                
//                nextVC.mainViewController = self
//                nextVC.selectedIndex = tableView.indexPathForSelectedRow?.row
//            }
//        }
//    }
    
  
    
    //MARK: - network
    
    func loadNews() {
        
        mainService.wallPosts(limit: limit, offset: 1, completion: { [weak self] (result) in
            switch result {
            case .success(let posts):
                print(posts)
                self?.dataManager.delete(with: PostObject.self, predicate: nil)
                self?.postsArray = PostObject.transfrom(posts)
                self?.dataManager.saveAll()
                self?.reloading()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }

        
    
}
