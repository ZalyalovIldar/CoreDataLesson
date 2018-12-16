//
//  CustomTableViewCell.swift
//  NewProject
//
//  Created by Гузель on 03.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textOfPostLabel: UILabel!
    @IBOutlet weak var avatarOfGroupImageView: UIImageView!
    @IBOutlet weak var nameOfGroupLabel: UILabel!
    @IBOutlet weak var someImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    weak var currentViewController: UIViewController!
    var viewControllerUtils: ViewControllerUtils!
    

    // MARK: - Методы -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Adding content and sharing -
    
    /// инициализация
    ///
    /// - Parameters:
    ///   - post: объект типа Post
    ///   - controller: контроллер типа UIViewController
    func addingContent(post: PostObject, controller:UIViewController) {

        textOfPostLabel.text = post.text
        currentViewController = controller
        likeCountLabel.text = String(post.likes?.count ?? 0)
        print(post.id)
        viewControllerUtils = ViewControllerUtilsImplementation()
    }
    
    
    /// метод для шаринга с помощью UIActivityViewController
    ///
    /// - Parameter sender: any sender
    @IBAction func shareAction(_ sender: Any) {
        viewControllerUtils.shareAction(textOfPostLabel: textOfPostLabel, currentViewController: currentViewController)
    }
    
}
