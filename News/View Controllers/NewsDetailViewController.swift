//
//  NewsDetailViewController.swift
//  News
//
//  Created by Feruza Atahodjaeva on 5/14/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import WebKit
import SDWebImage
import SafariServices



class NewsDetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var imageView:UIImageView?
    @IBOutlet weak var titleLabel:UILabel?
    @IBOutlet weak var subtitleLabel:UILabel?
    @IBOutlet weak var webView:WKWebView?
    @IBOutlet weak var heightConstraint:NSLayoutConstraint?
    
    var article: Article!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        title = article.title
        titleLabel?.text = article.title
        subtitleLabel?.text = "\(formatter.string(from: article.date)) · \(article.author)"
        
        
        imageView?.sd_setImage(with: URL(string: article.image), completed: nil)
        
        webView?.navigationDelegate = self
        
        
        webView?.loadHTMLString("""
            <html>
                <head>
                    <link rel = "stylesheet" type = "text/css"
        href = "https://learnappmaking.com/ex/webview.css">
                    <meta name = "viewport" content="width=device-width, initial-scale=1">
                </head>
                <body>
                            \(article.text)
                            <a class="button" href="\(article.url)">Go to article</a>
                </body>
            </html>
        """, baseURL: nil)
        
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.readyState", completionHandler: { result, error in
                if result == nil || error != nil {
                    return
                }
                webView.evaluateJavaScript("document.body.offsetHeight", completionHandler: { result, error in
                    if let height = result as? CGFloat {
                        self.heightConstraint?.constant = height
                    }
                })
            })
        }
        
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
            guard navigationAction.navigationType == .linkActivated else {
                decisionHandler(.allow)
                return
            }
        }

        assert(article != nil, "article == nil in New Detail VC!")
    }
    
    

}
