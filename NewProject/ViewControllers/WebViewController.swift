//
//  WebViewController.swift
//  NewProject
//
//  Created by Гузель on 09.12.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=6777501&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&response_type=token&v=5.92") else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.navigationDelegate = self
        webView.load(urlRequest)
    }
}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            //todo make NORMALNO
            
            let url = URL(string: urlStr.replacingOccurrences(of: "#", with: "?"))!
            

            var dict = [String:String]()

            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            if let queryItems = components.queryItems {
                for item in queryItems {
                    dict[item.name] = item.value!
                }
            }

            if let token = dict["access_token"], let userID = dict["user_id"] {
                print(token)
                print(userID)
                UserDefaultsSettings.setUserID(userID)
                UserDefaultsSettings.setAccessToken(token)
                self.openTabbar()


            }
        }
        
        decisionHandler(.allow)
        
    }
    
    
    //MARK: - navigation
    
    func openTabbar() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar = storyBoard.instantiateViewController(withIdentifier: "Tabbar") as! UITabBarController
        self.present(tabbar, animated: true, completion: nil)
    }
    

}

