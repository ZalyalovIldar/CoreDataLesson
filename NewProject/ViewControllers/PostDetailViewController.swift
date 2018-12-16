//
//  PostDetailViewController.swift
//  NewProject
//
//  Created by Гузель on 04.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameOfGroupLabel: UILabel!
    @IBOutlet weak var textOfPostLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    weak var mainViewController: NewsViewController!
    var selectedIndex:Int!
    var viewControllerUtils: ViewControllerUtils!
    
    // MARK: - Методы -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewControllerUtils = ViewControllerUtilsImplementation()
    }
    
    // MARK: - Adding content and sharing -
    
    /// заполнение данных из основного контроллера в новое окно детальной информации.
//    func filling() {
//        
//        if let avatarData = mainViewController.somePostArray[selectedIndex].avatar as Data? {
//            avatarImageView.image = UIImage(data: avatarData)
//        }
//        nameOfGroupLabel.text = mainViewController.somePostArray[selectedIndex].name
//        textOfPostLabel.text = mainViewController.somePostArray[selectedIndex].textDescription
//        if let avatarData = mainViewController.somePostArray[selectedIndex].someImage as Data? {
//            contentImageView.image = UIImage(data: avatarData)
//        }
//    }
    
    
    /// метод для шаринга с помощью UIActivityViewController
    ///
    /// - Parameter sender: any sender
    @IBAction func sharingAction(_ sender: Any) {
        
        viewControllerUtils.shareAction(textOfPostLabel: textOfPostLabel, currentViewController: mainViewController)
    }
}
