//
//  WebController.swift
//  GithubGraphQL
//
//  Created by Felipe Souza on 09/03/22.
//  Copyright © 2022 test. All rights reserved.
//

import Foundation
import WebKit

class WebController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var url: String!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func loadWebView() {
        let url = URL(string: url)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
